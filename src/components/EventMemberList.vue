<template>
  <div class="event-member-list">
    <h3>Événements Inscrits</h3>
    <ul>
      <li v-for="event in memberEvents" :key="event.id">
        {{ event.nom }} - {{ formatDate(event.dateHeureDebut) }} - {{ event.lieu }}
        <button @click="unsubscribeFromEvent(event.id)">Se désinscrire</button>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'EventMemberList',
  props: {
    memberId: Number,
  },
  data() {
    return {
      // Données fictives pour illustration
      events: [
        { id: 1, nom: 'Conférence Tech', dateHeureDebut: '2024-05-20T09:00', lieu: 'Salle A', participants: [1, 2] },
        { id: 2, nom: 'Atelier DevOps', dateHeureDebut: '2024-06-15T14:00', lieu: 'Salle B', participants: [1] },
        // Ajouter plus d'événements comme nécessaire
      ]
    };
  },
  computed: {
    memberEvents() {
      return this.events.filter(event => event.participants.includes(this.memberId));
    }
  },
  methods: {
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

