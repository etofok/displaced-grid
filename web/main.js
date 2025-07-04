class ModuleData {
  constructor(id, name, description, image, videoSrc, e_slideBig, e_thumbnail, tooltip) {
    this.id                 = id;
    this.name               = name;
    this.description        = description;
    this.image              = image;
    this.videoSrc           = videoSrc;
    this.e_slideBig         = e_slideBig;
    this.e_thumbnail        = e_thumbnail;
    this.tooltip            = tooltip;
  }
}

const modules = [
    m_QuickCastAbilities         = new ModuleData(
        0, 
        'QuickCast abilities*', 
        'Fire abilities instantly at the cursor. No mouse click required!', 
        'assets/modules/QuickCast Abilities.png', 
        'assets/modules/QuickCast Abilities.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Cast abilities instantly wihout mouse left-click. This isnt a Displaced Grid module.<br>You will find how to enable this down below.'
        ),
    m_RapidFire                = new ModuleData(
        1, 
        'Rapid Fire casting', 
        'Press and hold ability key to fire repeatedly!', 
        'assets/modules/Rapid Fire Casting.png', 
        'assets/modules/Rapid Fire Casting.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Holding down an ability hotkey repeatedly activates its command. <br> This has great synergy with Quick Casts.'
        ),
    m_UnifiedOrders           = new ModuleData(
        2, 
        'Unified Orders', 
        'Attack, Cast and Move multiple control groups at once!', 
        'assets/modules/Unified Orders.png', 
        'assets/modules/Unified Orders.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'This module introduces a new modifier — CapsLock. <br>Orders (Move, Attack, etc) will affect multiple control groups. This also works for right-clicks. Set up groups to control in Settings.'
        ),    
    m_SetSkillPoint           = new ModuleData(
        3, 
        'Set skill point', 
        'Press CTRL + ability key to level up the ability instantly!', 
        'assets/modules/Set Skill Point.png', 
        'assets/modules/Set Skill Point.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Quickly level up an ability with CTRL.<br>Similar behavior to games like Dota 2.'
        ),
    m_CastOnYourself        = new ModuleData(
        4, 
        'Cast on yourself', 
        'Press ALT + ability key to cast the ability on yourself!', 
        'assets/modules/Cast on Yourself.png', 
        'assets/modules/Cast on Yourself.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Quickly cast an ability on yourself with Alt. <br>Since v2 this does work for Items: requires double-tap.'
        ),
    m_HealthbarsAlwaysStay            = new ModuleData(
        5, 
        'Healthbars Always Stay', 
        'ALT no longer toggles off the healthbars.', 
        'assets/modules/Block ALT.png', 
        'assets/modules/Block ALT.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'You will no longer lose healthbars when using items (i.e. healing salves).'
        ),    
    m_QuickDropItems            = new ModuleData(
        6, 
        'QuickDrop items', 
        'Quickly pass, sell, or drop items at the cursor!', 
        'assets/modules/QuickDrop Items.png', 
        'assets/modules/QuickDrop Items.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'New modifier key for items: CTRL. <br>Quickly Drop, Pass, or Sell items with CTRL.'
        ),
    m_QuickCastItems            = new ModuleData(
        7, 
        'QuickCast items', 
        'Fires items instantly at the cursor. No mouse click required!', 
        'assets/modules/QuickCast Items.png', 
        'assets/modules/QuickCast Items.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Cast items instantly without mouse left-click.<br>Set up specific Quick Cast slots in the Settings. <br>This is an experimental "tech-demo" module. Only supports 1920x1080 Classic.'
        ),
    m_CameraHotkeys             = new ModuleData(
        8, 
        'Instant camera', 
        'Instantly move the camera to the location of your selected control groups!', 
        'assets/modules/Instant Camera.png', 
        'assets/modules/Instant Camera.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Single-tap a control group to jump the camera to that group.<br>Set up specific control group slots in the Settings.'
        ),
    m_ShiftQueueItems      = new ModuleData(
        9, 
        'Shift-Queue items', 
        'Shift-Queue items while holding Shift!', 
        'assets/modules/Shift-Queue Items.png', 
        'assets/modules/Shift-Queue Items.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Shift-queue abilities and items without letting go of the Shift key each time. <br>Also works for the Alt key (for Cast on Yourself).'
        )
];

const e_moduleName              = document.getElementById("moduleName");
const e_moduleDesc              = document.getElementById("moduleDesc");
const e_moduleTooltip           = document.getElementById("moduleTooltip");
const e_moduleTooltipText       = document.getElementById("moduleTooltipText");
const modulesTotal              = modules.length;

let activeSlide                 = 0;






document.addEventListener('DOMContentLoaded', function() {

    // Slider
    var slider              = document.getElementById('slider');
    var beforeImg           = document.querySelector('.before-img');
    var afterImg            = document.querySelector('.after-img');
    var sliderButton        = document.querySelector('.slider-button');

    e_moduleTooltip.addEventListener('mousemove', () => {
        e_moduleTooltipText.style.visibility = 'visible';
    }) 

    e_moduleTooltip.addEventListener('mouseout', () => {
        e_moduleTooltipText.style.visibility = 'hidden';
    }) 

    function updateSlider(sliderPos) {
        var maskPosition = sliderPos + '%';
        beforeImg.style.maskImage = 'linear-gradient(to right, transparent ' + maskPosition + ', black ' + maskPosition + ')';
        afterImg.style.maskImage = 'linear-gradient(to right, black ' + maskPosition + ', transparent ' + maskPosition + ')';
        sliderButton.style.left = 'calc(' + sliderPos + '% - 18px)';
    }

    // Set up initial state of the slider
    var initialSliderPos = slider.value;
    updateSlider(initialSliderPos);

    // Add event listener for slider adjustments
    slider.addEventListener('input', function(e) {
        var sliderPos = e.target.value;
        updateSlider(sliderPos);
    });


    // Listen to FAQ dropdown buttons
    const questionBtns = document.querySelectorAll('.question-button');

    questionBtns.forEach(function(btn) {

        btn.addEventListener('click', function() {
            const answer = this.nextElementSibling;

            if (answer.classList.contains("show")) {
              answer.classList.remove("show");
            } else {
              answer.classList.add("show");
            }

        });
    });




    // remove context menu for .nocontextmenu elements
    const nocontextmenus = document.querySelectorAll('.nocontextmenu');
    nocontextmenus.forEach(element => { 

       element.addEventListener('contextmenu', () => {
          event.preventDefault();
       })
    });




    // Generate Slides and Thumbnails from the ModuleData
    var e_containerSlideBig             = document.getElementById('container-slide-big');
    var e_containerThumbnails           = document.getElementById('container-thumbnails');
    
    for (let i = 0; i < modulesTotal; i++) {

        // Generate Slides
        let slideBig = document.createElement('div');
        slideBig.className = 'slide';

        let video = document.createElement('video');
        video.className = 'nocontextmenu';
        video.autoplay = true;
        video.muted = true;
        video.preload = 'auto';
        video.loop = true;
        video.playsInline = true;
        video.poster = '';

        let source = document.createElement('source');

        source.type = 'video/mp4';
        source.src = modules[i].videoSrc;

        video.appendChild(source);
        slideBig.appendChild(video);
        e_containerSlideBig.appendChild(slideBig);

        modules[i].e_slideBig = slideBig;

        // Generate Thumbnails
        let thumbnail = document.createElement('input');

        thumbnail.type = 'button';
        thumbnail.className = 'button-slide-thumbnail';
        thumbnail.style.backgroundImage = 'url("' + modules[i].image + '")';

        e_containerThumbnails.appendChild(thumbnail);  
        modules[i].e_thumbnail = thumbnail;

        thumbnail.addEventListener('click', () => {
            event.preventDefault();
            DisplayModule(i);
       });

    }

    DisplayModule(activeSlide);
});



function DisplayModule(position) {

    for (let i = 0; i < modulesTotal; i++) {
        
        if (i === position) {

            activeSlide = position;

            modules[i].e_slideBig.style.display = 'block';
            modules[i].e_slideBig.classList.add('active');
            modules[i].e_thumbnail.classList.add('active');
        } else {

            modules[i].e_slideBig.style.display = 'none';
            modules[i].e_slideBig.classList.remove('active');
            modules[i].e_thumbnail.classList.remove('active');
        }

    }

    e_moduleName.innerHTML          = modules[position].name;   
    e_moduleDesc.innerHTML          = modules[position].description;
    e_moduleTooltipText.innerHTML   = modules[position].tooltip;
}



function nextSlide() {
    activeSlide = (activeSlide + 1) % modulesTotal;
    DisplayModule(activeSlide);
}

function prevSlide() {
    activeSlide = (activeSlide - 1 + modulesTotal) % modulesTotal;
    DisplayModule(activeSlide);
}


function checkForHTTP(str) {
    if (str.includes("http")) {
        return 1;
    } else {
        return 0;
    }
}



// Listen to FAQ dropdown buttons
const disabledBtns = document.querySelectorAll('.temp_disabled');

disabledBtns.forEach(function(btn) {
    var tempval = btn.innerHTML;

    btn.addEventListener('mousemove', function() {
        btn.innerHTML ='Join Launch Party';
    });

    btn.addEventListener('mouseout', function() {
        btn.innerHTML = tempval;
    });
});



