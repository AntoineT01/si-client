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
    <footer>
      <p>© 2024 TUX. Tous droits réservés.</p>
      <p> THOMAS Antoine | LE GOFF Tanguy | AMIL Abdelaziz</p>
    </footer>
  </div>
</template>

<script>
import Navbar from '../components/Navbar.vue';
import EventCard from '../components/EventCard.vue';
import ListeLieux from "../components/Lieux.vue";

export default {
  name: 'Home',
  components: {
    ListeLieux,
    Navbar,
    EventCard,
  },
  data() {
    return {
      events: [
        {
          id: 1,
          title: 'Conférence sur l\'innovation technologique',
          date: '2024-05-20',
          description: 'Une journée complète dédiée aux dernières tendances et innovations dans le secteur tech.',
        },
        {
          id: 2,
          title: 'Atelier développement durable dans l\'IT',
          date: '2024-06-15',
          description: 'Un atelier interactif pour explorer les pratiques durables dans le développement de logiciels.',
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
