

/* event.preventDefault(); */

/* ************************************* */
/* ---------- GLOBAL FUNCTION ---------- */
/* ************************************* */

function OnsubmitMailControl()
{
    var mail = $('#mail').val().match(/[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})/g);
    $('#error-message-mail').remove();
    if(!mail){
        $('#div-error-message-mail').append("<p class=\"text-danger\" id=\"error-message-mail\"> Une adresse mail valide, c'est mieux ! </p>");
        return false;
    }else{
        $('#error-message-mail').remove();
    }
}

function passwordControl($this)
{

    // Between 8 et 20 characters
    if($($this).val().length >= 8 && $($this).val().length <= 20){
        $('.character-number').addClass('condition-password-valid');
        $('.character-number').removeClass('condition-password-not-valid');
     }else
        $('.character-number').removeClass('condition-password-valid');
 
     // At least one uppercase
     var uppercase = $($this).val().match(/[A-Z]/g);
     if(uppercase){
        $('.uppercase').addClass('condition-password-valid');
        $('.uppercase').removeClass('condition-password-not-valid');
     }else
        $('.uppercase').removeClass('condition-password-valid');
        
     // At least one lowercase
     var lowercase = $($this).val().match(/[a-z]/g);
     if(lowercase){
        $('.lowercase').addClass('condition-password-valid');
        $('.lowercase').removeClass('condition-password-not-valid');
     }else
        $('.lowercase').removeClass('condition-password-valid');
 
     // At least one number
     var number = $($this).val().match(/[0-9]/g);
     if(number){
        $('.number').addClass('condition-password-valid');
        $('.number').removeClass('condition-password-not-valid');
     }else
        $('.number').removeClass('condition-password-valid');
     
     // At least one special character
     var specialCharacter = $($this).val().match(/[!«#$%&'()*+,-./:;<>=?@\[\]\\^_|\{\}]/g);
     if(specialCharacter){
        $('.special-character').addClass('condition-password-valid');
        $('.special-character').removeClass('condition-password-not-valid');
     }else
        $('.special-character').removeClass('condition-password-valid');
}

function OnsubmitPasswordControl()
{

    var control = true;

    // Between 8 et 20 characters
    if($('#new-password').val().length < 8 || $('#new-password').val().length > 20){
       $('.character-number').addClass('condition-password-not-valid');
       control = false;
    }else
        $('.character-number').removeClass('condition-password-not-valid');

    // At least one uppercase
    var uppercase = $('#new-password').val().match(/[A-Z]/g);
    if(!uppercase){
       $('.uppercase').addClass('condition-password-not-valid');
       control = false;
    }else
       $('.uppercase').removeClass('condition-password-not-valid');
       
    // At least one lowercase
    var lowercase = $('#new-password').val().match(/[a-z]/g);
    if(!lowercase){
       $('.lowercase').addClass('condition-password-not-valid');
       control = false;
    }else
       $('.lowercase').removeClass('condition-password-not-valid');

    // At least one number
    var number = $('#new-password').val().match(/[0-9]/g);
    if(!number){
       $('.number').addClass('condition-password-not-valid');
       control = false;
    }else
       $('.number').removeClass('condition-password-not-valid');
    
    // At least one special character
    var specialCharacter = $('#new-password').val().match(/[!«#$%&'()*+,-./:;<>=?@\[\]\\^_|\{\}]/g);
    if(!specialCharacter){
       $('.special-character').addClass('condition-password-not-valid');
       control = false;
    }else
       $('.special-character').removeClass('condition-password-not-valid');

    $('#error-message-password').remove();
    if(!control)
        $('#div-error-message-password').append('<p class="text-danger" id="error-message-password"> Veuillez remplir toutes les conditions </p>');
    else
        $('#error-message-password').remove();

    return control;  
}

function OnsubmitSimilarPasswordControl()
{

    $('#error-message-confim-password').remove();
    if($('#confirm-password').val() !== $('#new-password').val()){           
        $('#div-error-message-confim-password').append('<p class="text-danger" id="error-message-confim-password"> Vos mots de passe ne sont pas identiques </p>');
        return false;
    }else
        $('#error-message-confim-password').remove();
}



/* **************************** */
/* ---------- HEADER ---------- */
/* **************************** */

function serverSelectionControl()
{
    var control = true;

    $('#error-message-choose-server').remove();
    if(jQuery.inArray($('#name').val(), listServer) == -1){
        $('#div-error-message-choose-server').append('<p id="error-message-choose-server"  class="text-danger"> On choisit dans la liste svp </p>');
        control = false;
    }else   
        $('#error-message-choose-server').remove();

    return control;
}



/* ****************************************** */
/* ---------- BURGER / MOBILE MENU ---------- */
/* ****************************************** */

// Animation
$(".burger").on("click", function()
{
    $(".burger").toggleClass('burger-active');
})

// Toggleon the mobile menu
$('.burger').on('click', function()
{
    if($('.nav-mobile').hasClass('active')){
        $('.nav-mobile').removeClass('active');
        $('.mobile-overlay').removeClass('active');
    }else{
        $('.nav-mobile').addClass('active');
        $('.mobile-overlay').addClass('active');
    }
});

$('.mobile-overlay').on('click', function()
{
    if($('.nav-mobile').hasClass('active')){
        $('.nav-mobile').removeClass('active');
        $('.mobile-overlay').removeClass('active');
    }else{
        $('.nav-mobile').addClass('active');
        $('.mobile-overlay').addClass('active');
    }
    $(".burger").toggleClass('burger-active');
});



/* ************************************** */
/* ---------- ACCOUNT CREATION ---------- */
/* ************************************** */

$('#new-password').on('input', function()
{
    passwordControl(this);
});

function accountCreationControl()
{
    var control = true;

    if(OnsubmitMailControl() == false)
        control = false;
    if(OnsubmitPasswordControl() == false)
        control = false;
    if(OnsubmitSimilarPasswordControl() == false)
        control = false;

    return control;
}



/* *************************** */
/* ---------- STAND ---------- */
/* *************************** */

    /* **************** */
    /* ----- DESK ----- */
    /* **************** */

        /* ----- MAIL ----- */

function changeMailControl()
{
    var control = true;

    if(OnsubmitMailControl() == false)
        control = false;

    return control;
}

        /* ----- PASSWORD ----- */

$('#new-password').on('input', function(){
    passwordControl(this);
});

function changePasswordControl()
{
    var control = true;

    if(OnsubmitPasswordControl() == false)
        control = false;
    if(OnsubmitSimilarPasswordControl() == false)
        control = false;

    return control;
}

        /* ----- ADD SERVER ACCOUNT ----- */

$('#add-server').on('click', function(){
    $('.form-add-server').slideToggle(400);
});

// Keep open if error in the form
if($('.error-server-account').length){
    $('.form-add-server').show();
}

function addServerAccountControl()
{

    var control = true;

    $('#msg-name-server').remove();
    if(jQuery.inArray($('#name-server').val(), tabServerList) == -1){
        $('#div-name-server').append('<p id="msg-name-server"  class="text-danger"> On choisit dans la liste svp ! </p>');
        control = false;
    }else   
        $('#msg-name-server').remove();

    var namePersoLenght = $('#name-perso').val().length;
    $('#msg-name-perso').remove();
    if(namePersoLenght < 2 || namePersoLenght > 20){
        $('#div-name-perso').append('<p id="msg-name-perso" class="text-danger"> Entre 2 et 20 caractères </p>');
        control = false;
    }else
        $('#msg-name-perso').remove();

    var nameDiscordLenght = $('#name-discord').val().length;
    $('#msg-name-discord').remove();
    if(nameDiscordLenght){
        if(nameDiscordLenght < 2 || nameDiscordLenght > 20){
            $('#div-name-discord').append('<p id="msg-name-discord" class="text-danger"> Entre 2 et 20 caractères </p>');
            control = false;
        }else
            $('#msg-name-discord').remove();
    }

    return control;
}

        /* ----- SERVER ACCOUNT LIST (ACCORDION) ----- */

// Toggle CSS on accordion
$('.accordion-button').on('click', function(){
    if($(this).hasClass('collapsed'))
        $(this).removeClass('active-accordion');
    else{
        $('.accordion-button').removeClass('active-accordion');
        $(this).addClass('active-accordion');
    }
});

var idServer;
$('.valid-update-server-account').on('click', function(){
    idServer = $(this).attr('id').substr(28);
});
function updateServerAccountControl()
{
    var control = true;

    var namePersoLenght = $('#name-perso-'+idServer).val().length;
    $('#msg-name-perso-'+idServer).remove();
    if(namePersoLenght < 2 || namePersoLenght > 20){
        $('#div-name-perso-'+idServer).append('<p id="msg-name-perso-'+idServer+'" class="text-danger"> Entre 2 et 20 caractères </p>');
        control = false;
    }else
        $('#msg-name-perso-'+idServer).remove();

    var nameDiscordLenght = $('#name-discord-'+idServer).val().length;
    $('#msg-name-discord-'+idServer).remove();
    if(nameDiscordLenght){
        if(nameDiscordLenght < 2 || nameDiscordLenght > 20){
            $('#div-name-discord-'+idServer).append('<p id="msg-name-discord-'+idServer+'" class="text-danger"> Entre 2 et 20 caractères </p>');
            control = false;
        }else
            $('#msg-name-discord-'+idServer).remove();
    }

    return control;
}

// Keep open if error in the form
var searchParams = new URLSearchParams(window.location.search);
searchParams.has('name');
var idServerGet = searchParams.get('id_server');
if($('.error-delete').length){
    $('#form-delete-'+idServerGet).show();
    $('#btn-delete-'+idServerGet).toggle();
}

$('.btn-delete').on('click', function(){
    $(this).hide();
    let id = $(this).attr('id').substr(11);
    $('#form-delete-'+id+'').slideToggle(400);
});

$('.btn-cancel').on('click', function(){
    let id = $(this).attr('id').substr(11);
    $('#form-delete-'+id).slideUp(400);  
    $('#btn-delete-'+id).slideToggle();  
})

$('.valid-delete-server-account').on('click', function(){
    idServer = $(this).attr('id').substr(28);
});
function compteSupprimerServeur(){

    var control = true;
    var nameServer = $('#name-server-'+idServer).text().trim();
    var deleteConfirmation = $('#delete-confirmation-'+idServer).val();

    $('#error-message-delete-server-account').remove();
    if(nameServer != deleteConfirmation){
        $('#div-delete-confirmation-'+idServer).append('<p id="error-message-delete-server-account" class="text-danger"> Le nom du serveur est incorrect (Respectez les majuscules) </p>');
        control = false;
    }

    return control;
}    

        /* ----- ACCOUNT DELETE ----- */

$('#btn-delete-account').on('click', function(){
    $('#confirmation-delete-account').slideToggle(400);
});


    /* ***************** */
    /* ----- STOCK ----- */
    /* ***************** */