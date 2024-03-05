<template>
  <div class="create-event-form-container">
    <button class="close-form-button" @click="$emit('closeForm')">&#10005;</button>
    <form @submit.prevent="submitForm">
      <h2>Créer un nouvel événement</h2>

      <div class="form-field">
        <label for="eventTitle">Titre de l'événement</label>
        <input id="eventTitle" type="text" v-model="eventData.title" required>
      </div>

      <div class="form-field">
        <label for="startDate">Date de début</label>
        <input id="startDate" type="datetime-local" v-model="eventData.startDate" required>
      </div>

      <div class="form-field">
        <label for="endDate">Date de fin</label>
        <input id="endDate" type="datetime-local" v-model="eventData.endDate" required>
      </div>

      <div class="form-field">
        <label for="description">Description</label>
        <textarea id="description" v-model="eventData.description" required></textarea>
      </div>

      <div class="form-field">
        <label for="maxParticipants">Nombre maximum de participants</label>
        <input id="maxParticipants" type="number" v-model="eventData.maxParticipants" required>
      </div>

      <div class="form-field">
        <label for="location">Lieu</label>
        <select id="location" v-model="eventData.location" required>
          <option v-for="location in locations" :key="location.id" :value="location.name">
            {{ location.name + ' - ' + location.adresse + ' - ' + location.capaciteAccueil + ' places'}}
          </option>
        </select>
      </div>

      <button type="submit">Créer l'événement</button>
    </form>
  </div>
</template>

<script>
export default {
  name: 'CreateEventForm',
  data() {
    return {
      eventData: {
        title: '',
        startDate: '',
        endDate: '',
        description: '',
        maxParticipants: null,
        location: ''
      },
      locations: [] // Vous devez remplir ce tableau avec les données de vos lieux depuis la BDD
    };
  },
  mounted() {
    // Ici, vous pourriez charger vos données de lieux depuis votre backend ou BDD
    this.loadLocations();
  },
  methods: {
    submitForm() {
      // Logique pour soumettre les données du formulaire à votre backend
      console.log('Formulaire soumis', this.eventData);
      // Ici, vous feriez généralement un appel API pour enregistrer les données
    },
    loadLocations() {
      // Exemple de chargement de données des lieux
      this.locations = [
        // Les données réelles devraient venir de votre backend ou BDD
        { id: 1, name: 'Salle A' , adresse: '20 Av. Victor le Gorgeu, 29200 Brest', capaciteAccueil: 100},
        { id: 2, name: 'Salle B', adresse: '30 Av. Victor le Gorgeu, 29200 Brest', capaciteAccueil: 50 },
        { id: 3, name: 'Salle C', adresse: '40 Av. Victor le Gorgeu, 29200 Brest', capaciteAccueil: 150 }
      ];
    }
  }
};
</script>

<style scoped>
.create-event-form-container {
  max-width: 500px;
  margin: auto;
  padding: 20px;
  background: #f9f9f9;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-field {
  margin-bottom: 20px;
}

.form-field label {
  display: block;
  margin-bottom: 5px;
}

.form-field input,
.form-field textarea,
.form-field select {
  width: 100%;
  padding: 10px;
  border-radius: 5px;
  border: 1px solid #ddd;
}

button {
  padding: 10px 15px;
  background-color: #5cb85c;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}
.close-form-button {
  position: absolute;
  top: 10px;
  right: 10px;
  background: transparent;
  border: none;
  font-size: 24px;
  cursor: pointer;
}
</style>
