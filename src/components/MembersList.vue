<template>
  <div class="members-list">
    <h2>Liste des Membres</h2>
    <button @click="createMember">Créer Membre</button>
    <table>
      <thead>
      <tr>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="member in members" :key="member.id">
        <td>{{ member.nom }}</td>
        <td>{{ member.prenom }}</td>
        <td>
          <button @click="editMember(member.id)">Modifier</button>
          <button @click="deleteMember(member.id)">Supprimer</button>
          <button @click="showEvents(member.id)">Événements Inscrits</button>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: 'MembersList',
  data() {
    return {
      // Données fictives pour illustration
      members: [
        { id: 1, nom: 'Doe', prenom: 'John' },
        { id: 2, nom: 'Smith', prenom: 'Jane' }
      ]
    };
  },
  methods: {
    createMember() {
      // Logique pour créer un nouveau membre
      console.log("Création d'un membre...");
    },
    editMember(id) {
      // Logique pour modifier un membre
      console.log(`Modification du membre avec l'ID: ${id}`);
    },
    deleteMember(id) {
      // Logique pour supprimer un membre
      console.log(`Suppression du membre avec l'ID: ${id}`);
      // Ici, filtrer `this.members` pour supprimer le membre
    },
    showEvents(id) {
      // Logique pour afficher les événements inscrits par le membre
      console.log(`Affichage des événements pour le membre avec l'ID: ${id}`);
    }
  }
};
</script>

<style scoped>
.members-list {
  display: flex;
  flex-direction: column;
}
.member-item {
  border-bottom: 1px solid #ccc;
  padding: 10px 0;
  display: flex;
  justify-content: space-between;
}
.member-info h3 {
  margin: 0;
}
.member-actions button {
  margin-right: 10px;
}
</style>