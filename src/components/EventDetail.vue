<template>
  <div class="event-detail">
    <!-- Détails de l'événement -->
    <h2>{{ event.nom }}</h2>
    <p><strong>Date de début :</strong> {{ formattedStartDate }}</p>
    <p><strong>Date de fin :</strong> {{ formattedEndDate }}</p>
    <p><strong>Description :</strong> {{ event.description }}</p>
    <p><strong>Nombre maximum de participants :</strong> {{ event.maxParticipant }}</p>
    <p><strong>Nombre de participants inscrits :</strong> {{ event.participants.length }}</p>
    <p><strong>Lieu :</strong> {{ event.location }}</p>

    <!-- Liste des participants -->
    <h3>Liste des participants :</h3>
    <ul>
      <li v-for="participant in event.participants" :key="participant.id">
        {{ participant.nom }} {{ participant.prenom }}
      </li>
    </ul>

    <!-- Section des commentaires -->
    <h3>Commentaires :</h3>
    <div class="comments-section">
      <div v-for="comment in event.comments" :key="comment.id" class="comment-bubble">
        <div class="comment-content">
          <strong>{{ comment.auteur.nom }} {{ comment.auteur.prenom }}:</strong> {{ comment.texte }}
        </div>
        <div class="comment-date">
          {{ formatCommentDate(comment.dateMessage) }}
        </div>
      </div>
    </div>

    <!-- Formulaire pour ajouter un commentaire -->
    <div class="comment-form">
      <textarea v-model="newCommentText" placeholder="Ajouter un commentaire..." class="comment-textarea"></textarea>
      <button @click="postComment" class="comment-post-btn">Commenter</button>
    </div>

    <!-- Carte pour afficher l'emplacement de l'événement -->
    <div id="event-map" style="height: 300px;"></div>
  </div>
</template>

<script>
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';

export default {
  name: 'EventDetail',
  props: {
    event: {
      type: Object,
      default: () => ({}),
    },
  },
  data() {
    return {
      newCommentText: '',
      map: null,
    };
  },
  mounted() {
    if (this.event.location) {
      this.initMap();
    }
  },
  methods: {
    formatCommentDate(date) {
      const options = { year: 'numeric', month: 'long', day: 'numeric' };
      return new Date(date).toLocaleString('fr-FR', options);
    },
    postComment() {
      console.log("Commentaire posté :", this.newCommentText);
      this.newCommentText = '';
    },
    async geocodeAddress(address) {
      const url = `https://nominatim.openstreetmap.org/search?format=json&limit=1&q=${encodeURI(address)}`;
      const response = await fetch(url);
      const data = await response.json();
      if (data.length > 0) {
        const { lat, lon } = data[0];
        return { lat, lon };
      }
      return null;
    },
    async initMap() {
      const coords = await this.geocodeAddress(this.event.location);
      if (coords) {
        this.map = L.map('event-map').setView([coords.lat, coords.lon], 13);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
          maxZoom: 19,
          attribution: '© OpenStreetMap contributors'
        }).addTo(this.map);

        L.marker([coords.lat, coords.lon]).addTo(this.map)
            .bindPopup(this.event.location)
            .openPopup();
      }
    }
  },
  computed: {
    formattedStartDate() {
      const options = { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' };
      return new Date(this.event.dateHeureDebut ).toLocaleString('fr-FR', options);
    },
    formattedEndDate() {
      const options = { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' };
      return new Date(this.event.dateHeureFin).toLocaleString('fr-FR', options);
    },
  },
  beforeDestroy() {
    if (this.map) {
      this.map.remove();
    }
  }
};
</script>

<style scoped>
.comment-form {
  display: flex;
  align-items: center;
  margin-top: 20px;
}

.comment-textarea {
  flex-grow: 1;
  margin-right: 10px;
  padding: 10px;
}

.comment-post-btn {
  padding: 10px 15px;
  background-color: #4CAF50; /* Green background */
  color: white; /* White text */
  border: none;
  cursor: pointer;
}
.comment-form {
  margin-top: 20px;
}

.comment-form textarea {
  width: 100%;
  margin-bottom: 10px;
  padding: 10px;
}

.comment-form button {
  padding: 5px 15px;
}
.comment-bubble {
  background-color: #f4f4f8;
  border-radius: 15px;
  padding: 10px;
  margin-bottom: 10px;
  max-width: 80%;
}

.comment-content {
  margin-bottom: 5px;
}

.comment-date {
  font-size: 0.8em;
  text-align: right;
  color: #888;
}
event-map{
  z-index: 0;
}
</style>
