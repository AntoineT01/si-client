<template>
  <div class="event-card">
    <!-- En-tête de la carte -->
    <div class="event-footer" v-if="!showDetails">
      <div class="event-header">
        <h3 class="event-title">{{ event.title }}</h3>
        <p>Date de début : {{ formattedStartDate }}</p>
      </div>
      <p class="event-description">{{ event.description }}</p>
      <button @click="toggleDetails" class="event-detail-btn">Détails</button>
      <button @click="showConfirmationDialogSuppr = true" class="event-delete-btn">Supprimer</button>
      <button @click="showConfirmationDialogModif = true" class="event-edit-btn">Modifier</button>

    </div>


    <!-- Détails de l'événement -->
    <div v-if="showDetails" class="event-detail-container">
      <EventDetail :event="event" />
      <button @click="toggleDetails" class="close-detail-btn">✕</button>

      <button @click="showConfirmationDialog = true" class="event-register-btn">S'inscrire</button>
      <button @click="showConfirmationDialogSuppr = true" class="event-delete-btn">Supprimer</button>
      <button @click="showConfirmationDialogModif = true" class="event-edit-btn">Modifier</button>
      <!-- Bouton de fermeture des détails -->

    </div>

    <!-- Dialogue de confirmation intégré -->
    <div v-if="showConfirmationDialog" class="dialog-overlay">
      <div class="dialog">
        <h3>Confirmation d'inscription</h3>
        <p>Voulez-vous vraiment vous inscrire à cet événement?</p>
        <div class="dialog-actions">
          <button @click="registerForEvent" class="dialog-button confirm">Confirmer</button>
          <button @click="cancelRegistration" class="dialog-button cancel">Annuler</button>
        </div>
      </div>
    </div>

    <!-- Dialogue de confirmation intégré suppression -->
    <div v-if="showConfirmationDialogSuppr" class="dialog-overlay">
      <div class="dialog">
        <h3>Confirmation de suppression</h3>
        <p>Voulez-vous vraiment supprimer cet événement?</p>
        <div class="dialog-actions">
          <button @click="deleteEvent" class="dialog-button confirm">Confirmer</button>
          <button @click="cancelDelete" class="dialog-button cancel">Annuler</button>
        </div>
      </div>
    </div>

  </div>
</template>

<script>
import EventDetail from './EventDetail.vue';

export default {
  name: 'EventCardConnected',
  components: {
    EventDetail,
  },
  props: {
    event: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      showDetails: false,
      showConfirmationDialog: false,
      showConfirmationDialogSuppr: false,
    };
  },
  computed: {
    formattedStartDate() {
      const options = { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' };
      return new Date(this.event.startDate).toLocaleString('fr-FR', options);
    },
  },
  methods: {
    toggleDetails() {
      this.showDetails = !this.showDetails;
    },
    registerForEvent() {
      console.log(`Registered for ${this.event.title}`);
      this.showConfirmationDialog = false;
    },
    cancelRegistration() {
      this.showConfirmationDialog = false;
    },
    deleteEvent() {
      console.log(`Deleted event: ${this.event.title}`);
      this.showConfirmationDialogSuppr = false;
    },
    cancelDelete() {
      this.showConfirmationDialogSuppr = false;
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
