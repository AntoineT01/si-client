<template>
  <div class="homeConnected">
    <!-- Navbar -->
    <NavbarConnected />

    <!-- Section Événements -->
    <section class="events">
      <h2>Événements à venir</h2>
      <div class="event-list">
        <EventCardConnected v-for="event in events" :key="event.id" :event="event" />
      </div>
    </section>

    <!-- Pied de page -->
    <Footer />
  </div>
</template>

<script>
import NavbarConnected from '../components/NavbarConnected.vue';
import EventCardConnected from '../components/EventCardConnected.vue';
import Footer from "../components/Footer.vue";

export default {
  name: 'HomeConnected',
  components: {
    Footer,
    NavbarConnected,
    EventCardConnected,
  },
  data() {
    return {
      events: [
        {
          id: 1,
          nom: "Conférence sur l'innovation technologique",
          dateHeureDebut: "2024-05-20T09:00",
          dateHeureFin: "2024-05-20T17:00",
          description: "Une journée complète dédiée aux dernières tendances et innovations dans le secteur tech.",
          maxParticipant: 100,
          location: "20 Av. Victor le Gorgeu, 29200 Brest",
          participants: [
            { id: 1, nom: 'Doe', prenom: 'John' },
            { id: 2, nom: 'Smith', prenom: 'Jane' },
            // Plus de participants ici...
          ],
        },
        // Ajoutez d'autres événements fictifs ici
        {
          id: 2,
          nom: "Séminaire sur le développement durable",
          dateHeureDebut: "2024-06-15T09:00",
          dateHeureFin: "2024-06-15T17:00",
          description: "Une journée complète dédiée aux dernières tendances et innovations dans le secteur tech.",
          maxParticipant: 50,
          location: "30 Av. Victor le Gorgeu, 29200 Brest",
          participants: [
            { id: 3, nom: 'Doe', prenom: 'John' },
            { id: 4, nom: 'Smith', prenom: 'Jane' },
            // Plus de participants ici...
          ],
        },



      ],
    };
  },
};
</script>

<style scoped>

.events {
  padding: 20px;
}

footer {
  background-color: #f8f9fa;
  text-align: center;
  padding: 20px;
  margin-top: 40px;
}
</style>
