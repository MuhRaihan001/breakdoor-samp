### Overview

The Lockpick System provides a mechanism for players to attempt to break into vehicles in a game environment. This system includes functionalities such as determining success chance based on player skill, disabling vehicle alarms, and breaking vehicle keys.

---
### REQUIRED
- Mysql R39
- Gamemode Jvrp

### Functions

#### 1. `Lock: SuccessChance(playerid)`

- **Description:** Calculates the success chance of breaking the vehicle key based on the player's screwdriver skill.
- **Parameters:** 
  - `playerid`: The ID of the player attempting the lockpick.
- **Returns:** 
  - `chance`: The calculated success chance, capped at 100.

#### 2. `Lock: DisableVehicleAlarm(playerid, vehicleid)`

- **Description:** Disables the alarm of the targeted vehicle.
- **Parameters:** 
  - `playerid`: The ID of the player attempting to disable the alarm.
  - `vehicleid`: The ID of the vehicle with the alarm to be disabled.

#### 3. `Lock: BreakVehicleKey(playerid, vehicleid)`

- **Description:** Attempts to break the key of the targeted vehicle.
- **Parameters:** 
  - `playerid`: The ID of the player attempting to break the key.
  - `vehicleid`: The ID of the vehicle whose key is being broken.

#### 4. `CMD: lockpick(playerid)`

- **Description:** Command for players to initiate the lockpicking process.
- **Parameters:** 
  - `playerid`: The ID of the player initiating the lockpick.
- **Returns:** 
  - `1` if the command is successfully executed.

---

### How to Use

1. **Adding the Lockpick System to Your Script:** Include the provided lockpick system code in your game script.
   
2. **Calling the `lockpick` Command:**
   - Players can initiate the lockpick process by entering the `/lockpick` command.
   - The player must be near a vehicle to use this command.
   - A screwdriver is required for the lockpick attempt.
   - Upon initiation, the player will be unable to control their character temporarily.

3. **Outcome of Lockpicking Attempt:**
   - If successful, the vehicle's alarm will be disabled, and the player gains lockpicking skill experience.
   - If unsuccessful, the alarm will sound, and the player will be notified of the failure.

4. **Integration with Player Skill System:**
   - The success chance of lockpicking is influenced by the player's screwdriver skill.
   - Ensure the player's screwdriver skill is updated accordingly upon successful lockpicking attempts.

---

### Note:

- Adjust the timers and skill calculations as per your game's balance and requirements.
- Ensure proper error handling and validation to prevent exploits or unintended behavior.
- Integrate the lockpick system seamlessly into your existing game environment for an immersive experience.

- ### Creator
Created by TsumuX and this code is MIT licensed
