<template>
  <form @submit.prevent="onSubmit">
    <div class="form-group">
      <label for="nom">Nom</label>
      <input type="text" id="nom" v-model="member.nom" required>
    </div>

    <div class="form-group">
      <label for="prenom">Prénom</label>
      <input type="text" id="prenom" v-model="member.prenom" required>
    </div>

    <div class="form-group">
      <label for="dateNaissance">Date de Naissance</label>
      <input type="date" id="dateNaissance" v-model="member.dateNaissance" required>
    </div>

    <div class="form-group">
      <label for="adresse">Adresse</label>
      <input type="text" id="adresse" v-model="member.adresse" required>
    </div>

    <div class="form-group">
      <label for="email">Email</label>
      <input type="email" id="email" v-model="member.email" required>
    </div>

    <button type="submit">Sauvegarder</button>
  </form>
</template>

<script>
export default {
  name: 'MemberForm',
  props: {
    member: {
      type: Object,
      default: () => ({
        nom: '',
        prenom: '',
        dateNaissance: '',
        adresse: '',
        email: ''
      })
    }
  },
  methods: {
    onSubmit() {
      this.$emit('saveMember', this.member);
    }
  }
};
</script>

<style scoped>
.form-group {
  margin-bottom: 1em;
}

label {
  display: block;
  margin-bottom: .5em;
}

input[type="text"],
input[type="date"],
input[type="email"] {
  width: 100%;
  padding: .5em;
  margin-bottom: .5em;
}

button {
  padding: .5em 1em;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #368f6a;
}
</style>
