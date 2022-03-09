$(function() {
    var actionContainer = $(".actionmenu");

    window.addEventListener('message', function (event) {
        if (event.action = "showMenu") {
            var root = document.documentElement;
            let mechanicalLevel = event.data.mechanic_lvl;
            let mechanicalPorcet = event.data.mechanic_porcent;
            $(".mechanical_lvl").text("Lvl. " + mechanicalLevel);
            root.style.setProperty('--mechaical_porcent', mechanicalPorcet);
            let stealLevel = event.data.steal_lvl;
            let stealPorcet = event.data.steal_porcent;
            $(".steal_lvl").text("Lvl. " + stealLevel);
            root.style.setProperty('--steal_porcent', stealPorcet);
            let athleticsLevel = event.data.athletics_lvl;
            let athleticsPorcet = event.data.athletics_porcent;
            $(".athletics_lvl").text("Lvl. " + athleticsLevel);
            root.style.setProperty('--athletics_porcent', athleticsPorcet);
            let swimmingLevel = event.data.swimming_lvl;
            let swimmingPorcet = event.data.swimming_porcent;
            $(".swimming_lvl").text("Lvl. " + swimmingLevel);
            root.style.setProperty('--swimming_porcent', swimmingPorcet);
            let strenghtLevel = event.data.strenght_lvl;
            let strenghtPorcet = event.data.strenght_porcent;
            $(".strenght_lvl").text("Lvl. " + strenghtLevel);
            root.style.setProperty('--strenght_porcent', strenghtPorcet);
            let shooterLevel = event.data.shooter_lvl;
            let shooterPorcet = event.data.shooter_porcent;
            $(".shooter_lvl").text("Lvl. " + shooterLevel);
            root.style.setProperty('--shooter_porcent', shooterPorcet);
            let lungLevel = event.data.lung_lvl;
            let lungPorcet = event.data.lung_porcent;
            $(".lung_lvl").text("Lvl. " + lungLevel);
            root.style.setProperty('--lung_porcent', lungPorcet);
            let chemistryLevel = event.data.chemistry_lvl;
            let chemistryPorcet = event.data.chemistry_porcent;
            $(".chemistry_lvl").text("Lvl. " + chemistryLevel);
            root.style.setProperty('--chemistry_porcent', chemistryPorcet);
            let agricultureLevel = event.data.agriculture_lvl;
            let agriculturePorcet = event.data.agriculture_porcent;
            $(".agriculture_lvl").text("Lvl. " + agricultureLevel);
            root.style.setProperty('--agriculture_porcent', agriculturePorcet);
            let metallurgyLevel = event.data.metallurgy_lvl;
            let metallurgyPorcet = event.data.metallurgy_porcent;
            $(".metallurgy_lvl").text("Lvl. " + metallurgyLevel);
            root.style.setProperty('--metallurgy_porcent', metallurgyPorcet);
            let sewingLevel = event.data.sewing_lvl;
            let sewingPorcet = event.data.sewing_porcent;
            $(".sewing_lvl").text("Lvl. " + sewingLevel);
            root.style.setProperty('--sewing_porcent', sewingPorcet);
            let fishingLevel = event.data.fishing_lvl;
            let fishingPorcet = event.data.fishing_porcent;
            $(".fishing_lvl").text("Lvl. " + fishingLevel);
            root.style.setProperty('--fishing_porcent', fishingPorcet);
            let mininglevel = event.data.mining_lvl;
            let miningPorcent = event.data.mining_porcent;
            $(".mining_lvl").text("Lvl. " + mininglevel);
            root.style.setProperty('--mining_porcent', miningPorcent);
    
            $('body').css('background-color', 'rgba(0, 0, 0, 0.15)')
            actionContainer.fadeIn();
    
        } else {
    
            $('body').css('background-color', 'transparent')
            actionContainer.fadeOut();
    
        }
    })

    document.onkeyup = function(data) {
        if (data.which == 27) {
          if (actionContainer.is(":visible")) {
            sendData("ButtonClick", "fechar");
          }
        }
      };

    function sendData(name, data) {
        $.post("http://dz_skill/" + name, JSON.stringify(data), function(
          datab
        ) {
          if (datab != "ok") {
            console.log(datab);
          }
        });
      }

})

