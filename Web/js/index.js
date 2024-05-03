const create = document.querySelector("#create_sled");
const sled_box = document.querySelector("pages");
const create_sled_box = document.querySelectorAll(".sled_info")[0];

create.addEventListener('click', () =>{
    console.log("Display info");
    create_sled_box.style = "display: flex";
});