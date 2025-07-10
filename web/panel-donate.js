// toggle panel on/off on click and set state
function toggleDonatePanel(event) {
    event.preventDefault();
    const panel = document.getElementById('donateOverlay');

    if (panel.style.display === 'flex') {
        panel.style.display = 'none';
        if (history.state && history.state.panelOpen) {
            history.replaceState({}, document.title, window.location.pathname + window.location.search);
        }
    } else {
        panel.style.display = 'flex';
        history.pushState({ panelOpen: true }, 'Donate Panel Open', '#donate-panel-open');
    }
}

document.addEventListener('DOMContentLoaded', function() {
    window.addEventListener('popstate', function(event) {
        const panel = document.getElementById('donateOverlay');

        if (panel.style.display === 'flex' && (!event.state || !event.state.panelOpen)) {
            panel.style.display = 'none';
        }
    });
});