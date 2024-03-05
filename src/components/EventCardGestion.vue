<template>
  <div class="event-card">
    <!-- En-tête de la carte -->
    <div class="event-header" v-if="!showDetails">
      <h3 class="event-title">{{ event.title }}</h3>
      <p>Date de début : {{ formattedStartDate }}</p>
      <p class="event-description">{{ event.description }}</p>
      <button @click="toggleDetails">Détails</button>
      <button @click="$emit('deleteEvent', event.id)">Supprimer</button>
      <button @click="$emit('editEvent', event)">Modifier</button>
    </div>
    <!-- Détails de l'événement -->
    <div v-if="showDetails" class="event-detail-container">
      <EventDetail :event="event" />
      <button @click="toggleDetails" class="close-detail-btn">✕</button>
      <button @click="$emit('deleteEvent', event.id)">Supprimer</button>
      <button @click="$emit('editEvent', event)">Modifier</button>
    </div>
  </div>
</template>

<script>
import EventDetail from './EventDetailGestion.vue';

export default {
  name: 'EventCardGestion',
  components: {
    EventDetail,
  },
  props: {
    event: Object,
  },
  data() {
    return {
      showDetails: false,
    };
  },
  methods: {
    toggleDetails() {
      this.showDetails = !this.showDetails;
    },
  },
  computed: {
    formattedStartDate() {
      const options = { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' };
      return new Date(this.event.startDate).toLocaleString('fr-FR', options);
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

/* Styles for the close button */
.close-detail-btn {
  position: absolute;
  top: 10px;
  right: 10px;
  border: none;
  background: none;
  cursor: pointer;
  font-size: 1.5rem;
  color: #333;
}

.event-detail-container {
  position: relative;
}
.dialog-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgba(0, 0, 0, 0.6);
}
.dialog {
  background: white;
  padding: 20px;
  border-radius: 5px;
  text-align: center;
}
.dialog-actions {
  margin-top: 20px;
}
.dialog-button {
  margin: 0 10px;
  padding: 5px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.confirm {
  background-color: #4CAF50;
  color: white;
}
.cancel {
  background-color: #f44336;
  color: white;
}
</style>

