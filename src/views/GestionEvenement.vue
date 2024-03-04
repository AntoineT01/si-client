<template>
  <NavbarConnected />
  <div class="gestionEvenement">
    <h1>Gestion des Événements</h1>
    <div class="add-event-button">
      <button @click="showEvenementForm">Ajouter un Événement</button>
    </div>
    <!-- Section Événements -->
    <section class="events">
      <h2>Événements à venir</h2>
      <div class="event-list">
        <EventCardGestion v-for="event in events" :key="event.id" :event="event" />
      </div>
    </section>
  </div>
  <Footer />
</template>

<script>
import NavbarConnected from '../components/NavbarConnected.vue';
import EventCardGestion from "../components/EventCardGestion.vue";
import Footer from '../components/Footer.vue';
import EventCardConnected from "../components/EventCardConnected.vue";

export default {
  name: 'GestionEvenement',
  components: {
    EventCardConnected,
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
            { id: 3, nom: 'Brown', prenom: 'Alice' },
            { id: 4, nom: 'Johnson', prenom: 'Bob' },
            // Plus de participants ici...
          ],
          comments: [
            { id: 1, text: "Hâte de découvrir cet atelier.", author: { nom: 'Brown', prenom: 'Alice' },date: "2024-06-01T12:00" },
            { id: 2, text: "J'espère apprendre de nouvelles choses.", author: { nom: 'Johnson', prenom: 'Bob' },date: "2024-06-01T12:30" },
          ],
        },
        {
          id: 3,
          title: "Soirée de lancement de produit",
          startDate: "2024-07-15T18:00",
          endDate: "2024-07-15T23:00",
          description: "Venez découvrir en avant-première notre dernier produit révolutionnaire.",
          maxParticipants: 150,
          location: "20 Av. Victor le Gorgeu, 29200 Brest",
          participants: [
            { id: 5, nom: 'Garcia', prenom: 'Carlos' },
            { id: 6, nom: 'Lopez', prenom: 'Elena' },
            // Plus de participants ici...
          ],
          comments: [
            { id: 1, text: "Hâte de découvrir ce produit.", author: { nom: 'Garcia', prenom: 'Carlos' }, date: "2024-07-01T12:00"},
            { id: 2, text: "J'espère apprendre de nouvelles choses.", author: { nom: 'Lopez', prenom: 'Elena' }, date: "2024-07-01T12:30"},
          ],
        }

      ],
    };
  },
  methods: {
    showEvenementForm(evenement = null) {
      this.selectedEvenement = evenement;
      this.showForm = true;
    },
    editEvenement(evenement) {
      this.selectedEvenement = evenement;
      this.showForm = true;
    },
    deleteEvenement(evenementId) {
      this.evenements = this.evenements.filter(evenement => evenement.id !== evenementId);
    },
    saveEvenement(evenement) {
      this.showForm = false;
    },
    closeForm() {
      this.showForm = false;
    },
  },
};
</script>

<style scoped>
.gestionEvenement {
  padding: 20px;
}

.add-event-button {
  text-align: center;
  margin-bottom: 20px;
}
</style>
