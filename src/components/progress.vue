<template>
    <div class="row"> 
        <div class="col-12 no-gutters">
            <div class="progress">
          <div class="progress-bar bg-success" role="progressbar" id="pb" v-bind:style="{width:value + '%'}" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        </div>
    </div>
</template>

<script>
export default{
    props:['value'],
    name: 'progress_',
    data(){
        return{
            progress: 0
        }
    }
}
</script>
<style>
.progress{
    width:100%;
    position:relative;
    margin-bottom:50px;
    margin-top:0;
    height:10px;
    top:0;
}
</style>