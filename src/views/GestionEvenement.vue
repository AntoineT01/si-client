<template>
  <NavbarConnected />
  <div class="gestionEvenement">
    <h1>Gestion des Événements</h1>
    <div class="add-event-button">
      <button @click="showEventForm">Ajouter un Événement</button>
    </div>
    <section class="events">
      <h2>Événements à venir</h2>
      <div class="event-list">
        <EventCardGestion v-for="event in events" :key="event.id" :event="event" @deleteEvent="deleteEvenement" @editEvent="editEvenement" />
      </div>
    </section>
  </div>
  <Footer />
</template>

<script>
import NavbarConnected from '../components/NavbarConnected.vue';
import EventCardGestion from "../components/EventCardGestion.vue";
import Footer from '../components/Footer.vue';

export default {
  name: 'GestionEvenement',
  components: {
    NavbarConnected,
    EventCardGestion,
    Footer,
  },
  data() {
    return {
      events: [
        {
          id: 1,
          title: "Conférence sur l'innovation technologique",
          startDate: "2024-05-20T09:00",
          endDate: "2024-05-20T17:00",
          description: "Une journée complète dédiée aux dernières tendances et innovations dans le secteur tech.",
          maxParticipants: 100,
          location: "20 Av. Victor le Gorgeu, 29200 Brest",
          participants: [
            { id: 1, nom: 'Doe', prenom: 'John' },
            { id: 2, nom: 'Smith', prenom: 'Jane' },
            // Plus de participants ici...
          ],
          comments: [
            { id: 1, text: "Hâte de découvrir cet événement.", author: { nom: 'Doe', prenom: 'John' },date: "2024-05-20T09:00" },
            { id: 2, text: "J'espère apprendre de nouvelles choses.", author: { nom: 'Smith', prenom: 'Jane' },date: "2024-05-01T12:30" },

          ],
        },
        // Ajoutez d'autres événements fictifs ici
        {
          id: 2,
          title: "Atelier de développement personnel",
          startDate: "2024-06-10T14:00",
          endDate: "2024-06-10T18:00",
          description: "Un atelier interactif pour apprendre à mieux se connaître et à développer son potentiel.",
          maxParticipants: 50,
          location: "20 Av. Victor le Gorgeu, 29200 Brest",
          participants: [
            { id: 1, nom: 'Doe', prenom: 'John' },
            { id: 2, nom: 'Smith', prenom: 'Jane' },
            // Plus de participants ici...
          ],
          comments: [
            { id: 1, text: "Hâte de découvrir cet événement.", author: { nom: 'Doe', prenom: 'John' },date: "2024-05-20T09:00" },
            { id: 2, text: "J'espère apprendre de nouvelles choses.", author: { nom: 'Smith', prenom: 'Jane' },date: "2024-05-01T12:30" },
          ],
        },
      ],
      showForm: false,
      selectedEvent: null,
    };
  },
  methods: {
    showEventForm(event = null) {
      this.selectedEvent = event;
      this.showForm = true;
    },
    editEvenement(event) {
      this.selectedEvent = event;
      this.showForm = true;
      // Logique pour éditer l'événement
    },
    deleteEvenement(eventId) {
      this.events = this.events.filter(event => event.id !== eventId);
      // Logique pour supprimer l'événement
    },
  },
};
</script>

<style>
.gestionEvenement {
  padding: 20px;
  max-width: 800px;
  margin: 0 auto;
}

.add-event-button {
  text-align: center;
  margin-bottom: 20px;
}

.events {
  padding: 20px;
}

</style>


