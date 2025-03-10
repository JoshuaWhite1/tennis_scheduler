document.addEventListener("DOMContentLoaded", function () {
    loadPlayers();
  
    document.getElementById("generate-schedule").addEventListener("click", function () {
      fetch("/schedules", { method: "POST" })
        .then(response => response.json())
        .then(data => displaySchedule(data))
        .catch(error => console.error("Error:", error));
    });
  });
  
  function loadPlayers() {
    fetch("/players")
      .then(response => response.json())
      .then(players => {
        const playerList = document.getElementById("player-list");
        playerList.innerHTML = "";
        players.forEach(player => {
          const li = document.createElement("li");
          li.textContent = `${player.name} (Skill: ${player.skill_level})`;
          playerList.appendChild(li);
        });
      })
      .catch(error => console.error("Error loading players:", error));
  }
  
  function displaySchedule(schedule) {
    const scheduleList = document.getElementById("schedule");
    scheduleList.innerHTML = "";
  
    schedule.forEach(game => {
      const li = document.createElement("li");
      li.textContent = `Game ${game.game_number}: Players ${game.player_1_id}, ${game.player_2_id}, ${game.player_3_id}, ${game.player_4_id}`;
      scheduleList.appendChild(li);
    });
  }
  