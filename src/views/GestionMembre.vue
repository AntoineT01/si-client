<template>
  <Navbar />
  <div class="gestion-membre">
    <h1>Gestion des Membres</h1>
    <MembersList :members="members" @editMember="editMember" @deleteMember="deleteMember" />
    <!-- Vous pouvez ajouter ici un bouton ou un lien pour ouvrir le formulaire d'ajout d'un nouveau membre -->
    <button @click="showAddMemberForm">Ajouter un nouveau membre</button>
    <!-- MemberForm pourrait être conditionnellement rendu ici, basé sur un flag dans les données -->
    <MemberForm v-if="showForm" @saveMember="saveMember" :member="selectedMember" />
  </div>
</template>

<script>
import Navbar from '../components/Navbar.vue';
import MembersList from '../components/MembersList.vue';
import MemberForm from '../components/MemberForm.vue';
import EventCard from "../components/EventCard.vue";

// Importez votre composant MemberForm ici si vous en avez un
// import MemberForm from './MemberForm.vue';

export default {
  name: 'GestionMembre',
  components: {
    Navbar,
    MembersList,
    // MemberForm,
  },

  data() {
    return {
      members: [
        { id: 1, nom: 'Doe', prenom: 'John', age: 28, adresse: '123 Rue Principale, Ville' },
        { id: 2, nom: 'Smith', prenom: 'Jane', age: 32, adresse: '456 Avenue Secondaire, Ville' },
      ],
      showForm: false,
      selectedMember: null,
    };
  },
  methods: {
    showAddMemberForm() {
      this.selectedMember = null; // Réinitialiser le membre sélectionné pour le formulaire d'ajout
      this.showForm = true;
    },
    editMember(id) {
      this.selectedMember = this.members.find(member => member.id === id);
      this.showForm = true;
    },
    deleteMember(id) {
      this.members = this.members.filter(member => member.id !== id);
    },
    saveMember(member) {
      if (member.id) {
        // Logique pour mettre à jour un membre existant
      } else {
        // Logique pour ajouter un nouveau membre
      }
      this.showForm = false;
    }
  }
};
</script>

<style scoped>
.gestion-membre {
  /* Styles de votre choix ici */
}
</style>
