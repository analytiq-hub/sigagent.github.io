function openCalendlyModal() {
    // Check if we're on mobile
    const isMobile = window.innerWidth <= 768;
    
    if (isMobile) {
        // For mobile, redirect to Calendly URL directly
        const calendlyUrl = 'https://calendly.com/analytiqhub';
        window.location.href = calendlyUrl;
    } else {
        // For desktop, open in new window
        window.open('https://calendly.com/analytiqhub', '_blank', 'width=800,height=600,scrollbars=yes,resizable=yes');
    }
}