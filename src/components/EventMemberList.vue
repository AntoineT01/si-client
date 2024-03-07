<template>
  <div class="event-member-list">
    <h3>Événements Inscrits</h3>
    <ul>
      <li v-for="event in events" :key="event.id">
        {{ event.nom }} - {{ formatDate(event.dateHeureDebut ) }} - {{ event.lieu }}
        <button @click="unsubscribeFromEvent(event.id)">Se désinscrire</button>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'EventMemberList',
  props: {
    memberId: Number,
  },
  data() {
    return {
      events: [] // Initialisez events comme un tableau vide
    };
  },
  created() {
    this.fetchEvents(); // Appelez fetchEvents lorsque le composant est créé
  },
  methods: {
    async fetchEvents() {
      try {
        const response = await axios.get(`http://localhost:8085/events/${this.memberId}/membres`);
        this.events = response.data;
      } catch (error) {
        console.error('Erreur lors de la récupération des événements', error);
      }
    },
    unsubscribeFromEvent(eventId) {
      console.log('Se désinscrire de l\'événement', eventId);
      this.$emit('unsubscribe', { memberId: this.memberId, eventId: eventId });
    },
    formatDate(value) {
      const date = new Date(value);
      return date.toLocaleDateString('fr-FR', { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' });
    }
  }
};
</script>

<style scoped>
.event-member-list ul {
  list-style-type: none;
  padding: 0;
}

.event-member-list li {
  margin-bottom: 10px;
}

.event-member-list button {
  margin-left: 10px;
}
</style>

