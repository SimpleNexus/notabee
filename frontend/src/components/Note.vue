<template>
  <v-card
    height="300"
    class="grey darken-3 d-flex flex-column"
    dark
  >
    <v-card-title>
      {{ note.title }}
    </v-card-title>
    <v-card-subtitle
      class="pb-0"
    >
      Created at: {{ new Date(note.createdAt).toLocaleString('en-US', { year: 'numeric', month: 'long', day: 'numeric' }) }}
      <!-- I probably wouldn't have known about computed properties, but I think that's a good sign if used here instead -->
    </v-card-subtitle>
    <v-card-subtitle
      v-if="note.source"
      class="py-0"
    >
      Source: {{ note.source }}
    </v-card-subtitle>
    <v-card-text
      height="300"
      class="pt-4"
    >
      {{ note.body }}
    </v-card-text>
    <v-card-actions
      class="flex-grow-1 d-flex flex-column align-start justify-end"
    >
      <v-btn
        text
        outlined
        color="error"
        class="mb-3 ml-3"
        @click="deleteNote"
      >
        Delete
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
import gql from 'graphql-tag'
export default {
  name: 'Note',
  props: {
    note: {
      type: Object,
      required: true
    }
  },
  methods: {
    deleteNote () {
      this.$apollo.mutate({
        mutation: gql`mutation ($noteId: ID!) {
          deleteNote(input: { params: { id: $noteId }}) {
            note {
              id
            }
          }
        }`,
        variables: {
          noteId: this.note.id
        }
      }).then(() => {
        this.$emit('note-deleted') // Nice way of touching bases on promises here
      })
    }
  }
}
</script>

