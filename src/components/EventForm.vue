<template>
  <form @submit.prevent="onSubmit">
    <div>
      <label for="nom">Nom de l'événement</label>
      <input id="nom" v-model="event.titre" required>
    </div>
    <div>
      <label for="dateHeureDebut">Date et heure de début</label>
      <input type="datetime-local" id="dateHeureDebut" v-model="event.dateHeureDebut" required>
    </div>
    <div>
      <label for="dateHeureFin">Date et heure de fin</label>
      <input type="datetime-local" id="dateHeureFin" v-model="event.dateHeureFin" required>
    </div>
    <div>
      <label for="description">Description</label>
      <textarea id="description" v-model="event.description" required></textarea>
    </div>
    <div>
      <label for="lieu">Lieu</label>
      <select id="lieu" v-model="event.lieu">
        <option disabled value="">Veuillez sélectionner un lieu</option>
      </select>
    </div>
    <button type="submit">Sauvegarder</button>
  </form>
</template>

<script>
export default {
  name: 'EventForm',
  props: {
    event: {
      type: Object,
      default: () => ({
        titre: '',
        dateHeureDebut: '',
        dateHeureFin: '',
        description: '',
        lieu: ''
      })
    }
  },
  methods: {
    onSubmit() {
      // Logique pour soumettre le formulaire
    }
  }
};
</script>
