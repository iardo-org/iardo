/* ================= CONFIGURATION ================= */
const CONFIG = {
    slots: [
    "09:30 AM",
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
    "11:30 AM",
    "12:00 PM",
    "12:30 PM",
    "01:00 PM",
    "01:30 PM",
    "02:30 PM",
    "03:00 PM",
    "03:30 PM",
    "04:00 PM",
    "04:30 PM",
    "05:00 PM",
    "05:30 PM"

    ],
    timezone: "IST",
    confirmPageUrl: "confirm-meeting.jsp"
};

/* ================= STATE MANAGEMENT ================= */
let selectedTime = null;
let selectedDate = null;

/* ================= DOM ELEMENTS ================= */
const dateInput = document.getElementById("meetingDate");
const slotsContainer = document.getElementById("slotsContainer");
const continueBtn = document.getElementById("continueBtn");

/* ================= UTILITY FUNCTIONS ================= */

/**
 * Set minimum date to today
 */
function setMinimumDate() {
    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const day = String(today.getDate()).padStart(2, '0');
    const minDate = `${year}-${month}-${day}`;
    
    dateInput.setAttribute('min', minDate);
}

/**
 * Check if selected date is Sunday
 */
function isSunday(dateString) {
    const date = new Date(dateString + 'T00:00:00');
    return date.getDay() === 0;
}

/**
 * Show custom notification
 */
function showNotification(message, type = 'info') {
    // Create notification element
    const notification = document.createElement('div');
    notification.className = `notification ${type}`;
    notification.textContent = message;
    
    // Add styles
    Object.assign(notification.style, {
        position: 'fixed',
        top: '20px',
        right: '20px',
        background: type === 'error' 
            ? 'linear-gradient(135deg, #ff0080, #ff4d4d)' 
            : 'linear-gradient(135deg, #5865f2, #00e5ff)',
        color: '#fff',
        padding: '16px 24px',
        borderRadius: '12px',
        boxShadow: '0 10px 30px rgba(0, 0, 0, 0.3)',
        zIndex: '10000',
        fontWeight: '500',
        fontSize: '15px',
        animation: 'slideInRight 0.4s cubic-bezier(0.16, 1, 0.3, 1)',
        maxWidth: '300px'
    });
    
    document.body.appendChild(notification);
    
    // Auto remove after 3 seconds
    setTimeout(() => {
        notification.style.animation = 'slideOutRight 0.4s cubic-bezier(0.16, 1, 0.3, 1)';
        setTimeout(() => notification.remove(), 400);
    }, 3000);
}

/**
 * Add slide animation styles
 */
function addNotificationStyles() {
    const style = document.createElement('style');
    style.textContent = `
        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(100px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
        
        @keyframes slideOutRight {
            from {
                opacity: 1;
                transform: translateX(0);
            }
            to {
                opacity: 0;
                transform: translateX(100px);
            }
        }
    `;
    document.head.appendChild(style);
}

/**
 * Reset time slot selection
 */
function resetTimeSelection() {
    selectedTime = null;
    document.querySelectorAll(".slot").forEach(slot => {
        slot.classList.remove("selected");
    });
    continueBtn.disabled = true;
}

/**
 * Create and render time slots
 */
function renderTimeSlots() {
    slotsContainer.innerHTML = '';
    
    CONFIG.slots.forEach((time, index) => {
        const slotElement = document.createElement("div");
        slotElement.className = "slot";
        slotElement.textContent = time;
        slotElement.setAttribute('role', 'button');
        slotElement.setAttribute('tabindex', '0');
        slotElement.setAttribute('aria-label', `Select time ${time}`);
        
        // Click handler
        slotElement.addEventListener("click", () => selectTimeSlot(slotElement, time));
        
        // Keyboard accessibility
        slotElement.addEventListener("keypress", (e) => {
            if (e.key === 'Enter' || e.key === ' ') {
                e.preventDefault();
                selectTimeSlot(slotElement, time);
            }
        });
        
        slotsContainer.appendChild(slotElement);
    });
}

/**
 * Handle time slot selection
 */
function selectTimeSlot(slotElement, time) {
    if (!dateInput.value) {
        showNotification("Please select a date first", "error");
        dateInput.focus();
        return;
    }
    
    // Remove previous selection
    document.querySelectorAll(".slot").forEach(s => s.classList.remove("selected"));
    
    // Add selection to clicked slot
    slotElement.classList.add("selected");
    selectedTime = time;
    
    // Enable continue button
    continueBtn.disabled = false;
    
    // Add haptic feedback (if supported)
    if (navigator.vibrate) {
        navigator.vibrate(50);
    }
}

/**
 * Handle date change
 */
function handleDateChange() {
    const dateValue = dateInput.value;
    
    if (!dateValue) {
        resetTimeSelection();
        return;
    }
    
    // Check if Sunday
    if (isSunday(dateValue)) {
        showNotification("Meetings are not available on Sundays", "error");
        dateInput.value = "";
        selectedDate = null;
        resetTimeSelection();
        return;
    }
    
    selectedDate = dateValue;
    resetTimeSelection();
    showNotification("Date selected! Now choose a time slot", "info");
}

/**
 * Handle continue button click
 */
function handleContinue() {
    if (!selectedDate || !selectedTime) {
        showNotification("Please select both date and time", "error");
        return;
    }
    
    // Add loading state
    continueBtn.textContent = "Processing...";
    continueBtn.disabled = true;
    
    // Simulate processing delay for better UX
    setTimeout(() => {
        const url = `${CONFIG.confirmPageUrl}?date=${encodeURIComponent(selectedDate)}&time=${encodeURIComponent(selectedTime)}&timezone=${encodeURIComponent(CONFIG.timezone)}`;
        window.location.href = url;
    }, 800);
}

/* ================= EVENT LISTENERS ================= */

// Date input change
dateInput.addEventListener("change", handleDateChange);

// Continue button click
continueBtn.addEventListener("click", handleContinue);

// Keyboard shortcut: Enter to continue
document.addEventListener("keypress", (e) => {
    if (e.key === 'Enter' && !continueBtn.disabled) {
        handleContinue();
    }
});

/* ================= INITIALIZATION ================= */

function init() {
    // Add notification styles
    addNotificationStyles();
    
    // Set minimum date
    setMinimumDate();
    
    // Render time slots
    renderTimeSlots();
    
    // Log initialization
    console.log("Meeting scheduler initialized successfully");
    console.log("Available slots:", CONFIG.slots);
    console.log("Timezone:", CONFIG.timezone);
}

// Initialize when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
} else {
    init();
}

/* ================= EXPORT FOR TESTING ================= */
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        CONFIG,
        isSunday,
        setMinimumDate,
        renderTimeSlots
    };
}
