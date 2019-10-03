<template>

    <router-link :to="{ name: 'SpecQuery', params: { query }}">{{name}}</router-link>

</template>
<script>
  
    export default {
        name: 'customLink',
        props: ['name', 'query']
    }

</script>