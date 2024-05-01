let theme_toggle = document.querySelector("#theme_toggle");

theme_toggle.addEventListener("click", () => {
    document.body.classList.toggle('dark_mode');
});

theme_toggle.addEventListener("mouseover", e => {
    e.target.style.cursor = "pointer";
});
