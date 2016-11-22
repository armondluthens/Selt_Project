<head>
<script src="jquery-3.1.1.min.js">

$(document).ready(function(){
    var header = $('toggle-header'),
        btn = $('button.toggle-nav');
        btn.on('click', function(){
            header.toggleClass('active');
        });
}); 

</script>
</head>

