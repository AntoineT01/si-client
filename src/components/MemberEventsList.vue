<template>
  <div class="member-events-list">
    <h2>Événements Inscrits</h2>
    <ul>
      <li v-for="event in memberEvents" :key="event.id">
        {{ event.nom }} - {{ event.dateHeureDebut | formatDate }} - {{ event.lieu }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'MemberEventsList',
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
  filters: {
    formatDate(value) {
      const date = new Date(value);
      return date.toLocaleDateString('fr-FR', { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' });
    }
  }
};
</script>

<style scoped>
.member-events-list ul {
  list-style-type: none;
  padding: 0;
}

.member-events-list li {
  margin-bottom: 10px;
}
</style>
