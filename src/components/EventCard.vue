<template>
  <div class="event-card">
    <h3>{{ event.title }}</h3>
    <p class="event-date">{{ formattedDate }}</p>
    <p class="event-description">{{ event.description }}</p>
    <!-- Vous pouvez ajouter plus de détails ici -->
    <button class="event-register-btn">S'inscrire</button>
  </div>
</template>

<script>
export default {
  name: 'EventCard',
  props: {
    event: {
      type: Object,
      required: true,
    },
  },
  computed: {
    // Utilisez une propriété calculée pour formater la date comme vous le souhaitez
    formattedDate() {
      const options = { year: 'numeric', month: 'long', day: 'numeric' };
      return new Date(this.event.date).toLocaleDateString('fr-FR', options);
    },
  },
};
</script>

<style scoped>
.event-card {
  border: 1px solid #eaeaea;
  border-radius: 8px;
  padding: 20px;
  margin-bottom: 16px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: transform 0.1s ease-in-out;
}

.event-card:hover {
  transform: translateY(-2px);
}

.event-date {
  color: #888;
  margin: 8px 0;
}

.event-description {
  color: #333;
}

.event-register-btn {
  background-color: #42b983;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  cursor: pointer;
  margin-top: 12px;
}

.event-register-btn:hover {
  background-color: #368f6a;
}
</style>
