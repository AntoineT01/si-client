<template>
  <NavbarConnected/>
  <div class="gestionMembres">
    <h1>Gestion des Membres</h1>
    <div class="add-member-button">
      <button @click="CreateMemberForm">Ajouter un Membre</button>
    </div>

    <!-- Formulaire de création de membre -->
    <CreateMemberForm v-if="showCreateMemberForm" @closeForm="closeForm" @saveMember="saveMember"
                      :member="selectedMember"/>
    <EditMemberForm v-if="showEditMemberForm" @closeForm="closeForm" @saveMember="saveMember" :member="selectedMember"/>
    <!-- Liste des membres -->
    <section class="members">
      <h2>Liste des Membres</h2>
      <div class="member-list">
        <MembreCard v-for="member in members" :key="member.id" :member="member" @editMember="editMember"  @deleteMember="deleteMember"
        />
      </div>
    </section>
  </div>
  <Footer/>
</template>

<script>
import NavbarConnected from '../components/NavbarConnected.vue';
import MembreCard from "../components/MemberCard.vue";
import CreateMemberForm from "../components/CreateMemberForm.vue";
import EditMemberForm from "../components/EditMemberForm.vue";
import Footer from '../components/Footer.vue';


export default {
  name: 'GestionMembres',
  components: {
    EditMemberForm,
    NavbarConnected,
    MembreCard,
    CreateMemberForm,
    Footer,
  },
  data() {
    return {
      members: [
        // Ici, vous devriez charger les données des membres depuis votre backend ou BDD
        {id: 1, nom: 'Doe', prenom: 'John', dateNaissance: '1980-01-01', adresse: '123 Rue Principale', email: 'john.doe@example.com', motDePasse: 'password123'},
        {id: 2, nom: 'Smith', prenom: 'Jane', dateNaissance: '1990-02-02', adresse: '456 Rue Secondaire', email: 'jane.smith@example.com', motDePasse: 'password456'},
        // Plus de membres ici...
      ],
      showCreateMemberForm: false,
      showEditMemberForm: false,
      selectedMember: null,
    };
  },
  methods: {
    CreateMemberForm() {
      this.showEditMemberForm = false;
      this.showCreateMemberForm = true;
    },
    editMember(member) {
      this.showCreateMemberForm = false;
      this.selectedMember = member;
      this.showEditMemberForm = true;

    },
    deleteMember(memberId) {
      // Logique pour supprimer le membre
      this.showEditMemberForm = false;
      this.members = this.members.filter(member => member.id !== memberId);
    },
    saveMember(member) {
      // Logique pour sauvegarder le membre dans la BDD
      console.log('Sauvegarder le membre', member);
      this.closeForm();
    },
    closeForm() {
      this.showCreateMemberForm = false;
      this.showEditMemberForm = false;
    },
  },
};
</script>

<style>
.gestionMembres {
  padding: 20px;
  max-width: 800px;
  margin: 0 auto;
}

.add-member-button {
  text-align: center;
  margin-bottom: 20px;
}

.members {
  padding: 20px;
}
</style>
