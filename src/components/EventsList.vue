<template>
  <div>
    <h2>Événements</h2>
    <ul>
      <li v-for="event in events" :key="event.id">
        {{ event.nom }} - {{ event.dateHeureDebut }} à {{ event.dateHeureFin }}
        <button @click="$emit('editEvent', event.id)">Modifier</button>
        <button @click="$emit('deleteEvent', event.id)">Supprimer</button>
        <button @click="$emit('viewDetail', event.id)">Détails</button>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'EventsList',
  props: {
    events: Array
  }
};
</script>
