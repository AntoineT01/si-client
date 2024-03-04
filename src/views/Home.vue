<template>
  <div class="home">
    <!-- Navbar -->
    <Navbar />

    <!-- Bannière principale -->
    <section class="banner">
      <h1>Bienvenue chez Tux & Co</h1>
      <p>Explorer | Apprendre | Connecter</p>
    </section>

    <!-- Section Événements -->
    <section class="events">
      <h2>Événements à Venir</h2>
      <div class="event-list">
        <EventCard v-for="event in events" :key="event.id" :event="event" />
        <ListeLieux></ListeLieux>
      </div>
    </section>

    <!-- Section À propos -->
    <section class="about">
      <h2>À propos de Nous</h2>
      <p>Nous sommes les TUX, votre partenaire dans l'organisation d'événements . Notre mission est de rassembler les professionnels du secteur pour partager connaissances et innovations.</p>
    </section>

    <!-- Section Contact -->
    <section class="contact">
      <h2>Contactez-nous</h2>
      <p>Avez-vous des questions? Voulez-vous collaborer sur un événement? N'hésitez pas à nous contacter.</p>
      <p>Email: contact@tux.com</p>
    </section>

    <!-- Pied de page -->
    <Footer />
  </div>
</template>

<script>
import Navbar from '../components/Navbar.vue';
import EventCard from '../components/EventCard.vue';
import Footer from "../components/Footer.vue";
import ListeLieux from "../components/Lieux.vue";

export default {
  name: 'Home',
  components: {
    Footer,
    ListeLieux,
    Navbar,
    EventCard,
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
          location: "Salle A, 123 rue Principale",
          participants: [
            { id: 1, nom: 'Doe', prenom: 'John' },
            { id: 2, nom: 'Smith', prenom: 'Jane' },
            // Plus de participants ici...
          ],
        },
        {
          id: 2,
          title: "Atelier de développement personnel",
          startDate: "2024-06-10T14:00",
          endDate: "2024-06-10T18:00",
          description: "Un atelier interactif pour apprendre à mieux se connaître et à développer son potentiel.",
          maxParticipants: 50,
          location: "Centre de bien-être, 42 avenue des Fleurs",
          participants: [
            { id: 3, nom: 'Brown', prenom: 'Alice' },
            { id: 4, nom: 'Johnson', prenom: 'Bob' },
            // Plus de participants ici...
          ],
        },
        {
          id: 3,
          title: "Soirée de lancement de produit",
          startDate: "2024-07-15T18:00",
          endDate: "2024-07-15T23:00",
          description: "Venez découvrir en avant-première notre dernier produit révolutionnaire.",
          maxParticipants: 150,
          location: "Espace de coworking, 7 rue des Entrepreneurs",
          participants: [
            { id: 5, nom: 'Garcia', prenom: 'Carlos' },
            { id: 6, nom: 'Lopez', prenom: 'Elena' },
            // Plus de participants ici...
          ],
        }

      ],
    };
  },
};
</script>

<style scoped>
/* Ajoutez ou modifiez le CSS ici pour styliser vos sections supplémentaires */
.banner, .about, .contact {
  padding: 40px 20px;
  text-align: center;
}

.events, .about, .contact {
  padding: 20px;
}

footer {
  background-color: #f8f9fa;
  text-align: center;
  padding: 20px;
  margin-top: 40px;
}
</style>
