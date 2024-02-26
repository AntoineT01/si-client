<template>
  <div class="home">
    <h1>Événements à venir</h1>
    <ul class="event-list">
      <!-- Boucle sur les événements et affiche une carte d'événement pour chaque -->
      <li v-for="event in events" :key="event.id">
        <EventCard :event="event" />
      </li>
    </ul>
    <!-- Boutons pour la navigation -->
    <button @click="goToLogin">Connexion</button>
    <button @click="goToRegister">Inscription</button>
  </div>
</template>

<script>
// Importation du composant EventCard
import EventCard from '../components/EventCard.vue';

export default {
  name: 'Home',
  components: {
    EventCard, // Déclare EventCard comme composant enfant
  },
  data() {
    return {
      // Liste des événements (exemple de données en dur)
      events: [
        {
          id: 1,
          title: 'Conférence Vue.js',
          date: '2024-03-15',
          description: 'Rejoignez-nous pour une journée de conférences sur Vue.js.',
        },
        {
          id: 2,
          title: 'Atelier de codage',
          date: '2024-04-20',
          description: 'Venez coder avec nous et apprendre de nouvelles compétences.',
        },
      ],
    };
  },
  methods: {
    // Méthodes pour la navigation
    goToLogin() {
      this.$router.push('/login'); // Redirige vers la page de connexion
    },
    goToRegister() {
      this.$router.push('/register'); // Redirige vers la page d'inscription
    },
  },
};
</script>
