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
      <h2>Évènements à Venir</h2>
      <div class="event-list">
        <EventCard v-for="event in events" :key="event.id" :event="event" />
        <ListeLieux></ListeLieux>
        <Commentaires></Commentaires>
        <Membres></Membres>
        <Evenement></Evenement>
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
import Commentaires from "../components/Commentaire.vue";
import Membres from "../components/Membres.vue";
import ListeLieux from "../components/Lieux.vue";
import Evenement from "../components/Evenement.vue";

export default {
  name: 'Home',
  components: {
    Footer,
    ListeLieux,
    Navbar,
    EventCard,
    Commentaires,
    Membres,
    Evenement,
  },

  mounted() {
    if (localStorage.getItem('membreId')) {
      this.$router.push('/homeConnected');
    }
  },
  data() {
    return {
      events: [
        {
          id: 1,
          nom: "Conférence sur l'innovation technologique",
          startDate: "2024-05-20T09:00",
          dateHeureFin: "2024-05-20T17:00",
          description: "Une journée complète dédiée aux dernières tendances et innovations dans le secteur tech.",
          maxParticipant: 100,
          location: "20 Av. Victor le Gorgeu, 29200 Brest", // remplacer par l'id du lieu : lieuId
          participants: [
            { id: 1, nom: 'Doe', prenom: 'John' },
            { id: 2, nom: 'Smith', prenom: 'Jane' },
            // Plus de participants ici...
          ],
        },
        {
          id: 2,
          nom: "Séminaire sur le développement durable",
          startDate: "2024-06-15T09:00",
          dateHeureFin: "2024-06-15T17:00",
          description: "Une journée complète dédiée aux dernières tendances et innovations dans le secteur tech.",
          maxParticipant: 50,
          location: "30 Av. Victor le Gorgeu, 29200 Brest", // remplacer par l'id du lieu : lieuId
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
