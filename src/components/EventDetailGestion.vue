<template>
  <div class="event-detail-Gestion">
    <!-- Détails de l'événement -->
    <h2>{{ event.title }}</h2>
    <p><strong>Date de début :</strong> {{ formattedStartDate }}</p>
    <p><strong>Date de fin :</strong> {{ formattedEndDate }}</p>
    <p><strong>Description :</strong> {{ event.description }}</p>
    <p><strong>Nombre maximum de participants :</strong> {{ event.maxParticipants }}</p>
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
        <div v-for="comment in event.comments" :key="comment.id" class="comment-container">
          <div class="comment-content-bubble">
            <strong>{{ comment.author.nom }} {{ comment.author.prenom }}:</strong> {{ comment.text }}
            <div class="comment-date">
              {{ formatCommentDate(comment.date) }}
            </div>
          </div>
          <button @click="prepareDeleteComment(comment.id)" class="comment-delete-btn">Supprimer</button>
        </div>
      </div>

      <!-- Pop-up de confirmation de suppression -->
      <div v-if="showConfirmationDialogSuppr" class="modal-overlay" @click.self="cancelDelete">
        <div class="modal">
          <h3>Confirmation de suppression</h3>
          <p>Voulez-vous vraiment supprimer ce commentaire?</p>
          <div class="modal-actions">
            <button @click="deleteComment" class="modal-button confirm">Confirmer</button>
            <button @click="cancelDelete" class="modal-button cancel">Annuler</button>
          </div>
        </div>
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
      showConfirmationDialogSuppr: false,
      commentToDelete: null,
    };
  },
  mounted() {
    if (this.event.location) {
      this.initMap();
    }
  },
  methods: {
    formatCommentDate(date) {
      const options = {year: 'numeric', month: 'long', day: 'numeric'};
      return new Date(date).toLocaleString('fr-FR', options);
    },
    postComment() {
      console.log("Commentaire posté :", this.newCommentText);
      this.newCommentText = '';
    },
    prepareDeleteComment(commentId) {
      this.commentToDelete = commentId;
      this.showConfirmationDialogSuppr = true;
    },
    deleteComment() {
      console.log(`Suppression du commentaire ID: ${this.commentToDelete}`);
      // Logique de suppression du commentaire
      this.showConfirmationDialogSuppr = false;
    },
    cancelDelete() {
      this.showConfirmationDialogSuppr = false;
      this.commentToDelete = null;
    },
    async geocodeAddress(address) {
      const url = `https://nominatim.openstreetmap.org/search?format=json&limit=1&q=${encodeURI(address)}`;
      const response = await fetch(url);
      const data = await response.json();
      if (data.length > 0) {
        const {lat, lon} = data[0];
        return {lat, lon};
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
      const options = {year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit'};
      return new Date(this.event.startDate).toLocaleString('fr-FR', options);
    },
    formattedEndDate() {
      const options = {year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit'};
      return new Date(this.event.endDate).toLocaleString('fr-FR', options);
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
.comments-section {
  margin-bottom: 20px;
}

.comment-container {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 10px;
}

.comment-content-bubble {
  background-color: #f4f4f8;
  border-radius: 15px;
  padding: 10px;
  flex-grow: 1;
}

.comment-date {
  font-size: 0.8em;
  text-align: right;
  color: #888;
}

.comment-delete-btn {
  margin-left: auto; /* Pousser le bouton vers la droite */
  padding: 5px 10px;
  /* Autres styles pour le bouton... */
}
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 10000;
}

.modal {
  background: white;
  padding: 20px;
  border-radius: 5px;
  text-align: center;
}

.modal-actions {
  margin-top: 20px;
}

.modal-button {
  margin: 0 10px;
  padding: 5px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.confirm {
  background-color: #4CAF50;
  color: white;
}

.cancel {
  background-color: #f44336;
  color: white;
}
#event-map {
  z-index: 0; /* Ou n'incluez pas de z-index si ce n'est pas nécessaire */
}

</style>
