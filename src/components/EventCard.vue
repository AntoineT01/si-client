<template>
  <div class="event-card">
    <div class="event-header">
      <h3 class="event-title">{{ event.title }}</h3>
      <p class="event-date">{{ formattedDate }}</p>
    </div>
    <p class="event-description">{{ event.description }}</p>
    <div class="event-footer">
      <button class="event-register-btn">S'inscrire</button>
    </div>
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
    formattedDate() {
      const options = { year: 'numeric', month: 'long', day: 'numeric' };
      return new Date(this.event.date).toLocaleDateString('fr-FR', options);
    },
  },
};
</script>

<style scoped>
.event-card {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  background-color: #fff;
  border: 1px solid #eaeaea;
  border-radius: 8px;
  padding: 20px;
  margin-bottom: 20px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.event-header, .event-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.event-title {
  margin: 0;
  color: #333;
  font-size: 1.5em;
}

.event-date {
  color: #666;
  font-size: 0.9em;
}

.event-description {
  margin: 16px 0;
  color: #444;
  font-size: 1em;
  line-height: 1.6;
}

.event-register-btn {
  background-color: #42b983;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
}

.event-register-btn:hover {
  background-color: #368f6a;
}
</style>
