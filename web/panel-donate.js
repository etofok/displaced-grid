    function toggleDonatePanel(event) {
      event.preventDefault();
      const panel = document.getElementById('donateOverlay');
      panel.style.display = panel.style.display === 'flex' ? 'none' : 'flex';
    }