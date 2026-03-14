note ══════════════════════════════════════════════════════════════════
note  QUILL QUEST — The Official Quill Language Learning Game
note  Learn to code in Quill through 15 exciting challenges
note  From beginner to master — one quest at a time
note  
note  Created by Jero W. Grabo — Quill Language Team
note  "Write code the way you think."
note ══════════════════════════════════════════════════════════════════

use gui.
use python "sys" as sys.
use python "os" as os.

set theme to "dark".
open a window titled "Quill Quest — Learn to Code" with width 1100, height 750.

note ── Game state ──────────────────────────────────────────────────
let current_level be 1.
let total_score be 0.
let lives be 3.
let badges be an empty list.
let attempts be 0.
let game_started be no.
let show_example be no.
let total_levels be 15.

note ── Header section ───────────────────────────────────────────────
create a row layout named headerRow.
create a label named gameTitleLabel saying "🪶 Quill Quest".
create a label named scoreLabel saying "Score: 0".
create a label named livesLabel saying "Lives: ❤️❤️❤️".
create a label named levelLabel saying "Level 1 / 15".
add gameTitleLabel, scoreLabel, livesLabel, levelLabel to headerRow.

note ── Progress bar ─────────────────────────────────────────────────
create a label named progressLabel saying "Progress: 0%".
create a progress bar named questProgress.

note ── Story and challenge card ─────────────────────────────────────
create a card layout named storyCard titled "The Quest".
create a label named storyLabel saying "Welcome to Quill Quest! Press Start to begin your adventure.".
create a label named challengeLabel saying "".
add storyLabel, challengeLabel to storyCard.

note ── Hint and example section ─────────────────────────────────────
create a card layout named hintCard titled "Wizard Hint".
create a label named hintLabel saying "Need help? Press the Hint button!".
create a label named exampleLabel saying "".
add hintLabel, exampleLabel to hintCard.

note ── Code editor section ──────────────────────────────────────────
create a card layout named editorCard titled "Your Quill Code".
create a label named editorPrompt saying "Type your Quill code here:".
create a text input named codeInput with placeholder "Type your answer here...".
add editorPrompt, codeInput to editorCard.

note ── Buttons ───────────────────────────────────────────────────────
create a row layout named buttonRow.
create a button named startBtn saying "Start Quest" that calls startGame.
create a button named submitBtn saying "Submit Answer" that calls submitAnswer.
create a button named hintBtn saying "Get Hint" that calls showHint.
create a button named exampleBtn saying "Show Example (costs a life)" that calls showExample.
create a button named nextBtn saying "Next Level" that calls nextLevel.
add startBtn, submitBtn, hintBtn, exampleBtn, nextBtn to buttonRow.

note ── Result display ─────────────────────────────────────────────────
create a card layout named resultCard titled "Result".
create a label named resultLabel saying "".
create a label named feedbackLabel saying "".
add resultLabel, feedbackLabel to resultCard.

note ── Badges and achievements ───────────────────────────────────────
create a card layout named badgeCard titled "Your Badges".
create a label named badgeLabel saying "Complete levels to earn badges!".
add badgeLabel to badgeCard.

note ── Settings panel ────────────────────────────────────────────────
create a row layout named settingsRow.
create a toggle named darkModeToggle saying "Dark Mode".
create a toggle named hintsToggle saying "Hints Enabled".
create a toggle named soundToggle saying "Sound Effects".
create a dropdown named difficultyDropdown with choices "Beginner", "Normal", "Hard", "Master".
add darkModeToggle, hintsToggle, soundToggle, difficultyDropdown to settingsRow.

note ── Level selector ────────────────────────────────────────────────
create a label named levelSelectorLabel saying "Jump to Level:".
create a slider named levelSlider from 1 to 15.

note ── Place all layouts in window ──────────────────────────────────
place headerRow in window.
place progressLabel in window.
place questProgress in window.
place storyCard in window.
place hintCard in window.
place editorCard in window.
place buttonRow in window.
place resultCard in window.
place badgeCard in window.
place settingsRow in window.
place levelSelectorLabel in window.
place levelSlider in window.

note ── Level data ────────────────────────────────────────────────────

define get_story taking level.
  if level is 1. return "The ancient Quill Oracle must be awakened with a greeting.". end if.
  if level is 2. return "The Oracle needs to know your name. Teach it memory.". end if.
  if level is 3. return "A magic gate requires the product of 7 and 8.". end if.
  if level is 4. return "A gatekeeper only allows adults to pass through.". end if.
  if level is 5. return "The Echo Chamber must repeat a sound exactly 5 times.". end if.
  if level is 6. return "Mages store reusable spells as named functions.". end if.
  if level is 7. return "A treasure chest holds a collection of 3 colors.". end if.
  if level is 8. return "The Ancient Codex stores knowledge as key-value pairs.". end if.
  if level is 9. return "Even brave heroes need safety nets when errors occur.". end if.
  if level is 10. return "Great mages create Golems — objects with data and behaviour.". end if.
  if level is 11. return "The Royal Scribe records everything to parchment files.". end if.
  if level is 12. return "Messenger hawks carry data across the internet.". end if.
  if level is 13. return "The Vault Keeper stores data forever in a database.". end if.
  if level is 14. return "Master window makers craft beautiful user interfaces.". end if.
  if level is 15. return "The Grand Finale — combine everything you have learned!". end if.
  return "Continue your quest...".
end define.

define get_challenge taking level.
  if level is 1. return "Print: Hello, Quill!". end if.
  if level is 2. return "Store your name in a variable and print: Hello, [name]!". end if.
  if level is 3. return "Create a variable 'result' equal to 7 times 8 and print it.". end if.
  if level is 4. return "Check if age (set to 20) is at least 18 and print the right message.". end if.
  if level is 5. return "Use repeat to print 'Echo!' exactly 5 times.". end if.
  if level is 6. return "Define a function 'greet' that takes a name and prints a greeting.". end if.
  if level is 7. return "Create a list of 3 colors and print each one.". end if.
  if level is 8. return "Create a map with name and age, then print both values.". end if.
  if level is 9. return "Write a try/catch that catches any error and prints it.". end if.
  if level is 10. return "Create an Animal class with name, sound, and a speak method.". end if.
  if level is 11. return "Write to a file, read it back, print the content.". end if.
  if level is 12. return "Fetch your IP from https://api.ipify.org and print it.". end if.
  if level is 13. return "Connect to SQLite, create a table, insert and query a row.". end if.
  if level is 14. return "Build a GUI window with a label and show it.". end if.
  if level is 15. return "Combine: function + list + loop + condition in one program.". end if.
  return "Complete the challenge.".
end define.

define get_hint taking level.
  if level is 1. return "Use: say \"text\".". end if.
  if level is 2. return "Use: let x be \"value\". then {x} in strings.". end if.
  if level is 3. return "Use 'times' for multiplication: 7 times 8.". end if.
  if level is 4. return "Use: if age is at least 18. ... else. ... end if.". end if.
  if level is 5. return "Use: repeat 5 times. ... end repeat.". end if.
  if level is 6. return "Use: define greet taking name. ... end define.". end if.
  if level is 7. return "Use: let x be a list of ..., for each item in x.". end if.
  if level is 8. return "Use: a map with 'key' as 'value', then map at 'key'.". end if.
  if level is 9. return "Use: try. ... catch error. ... end try.". end if.
  if level is 10. return "Use: define class X. it has y. define create. end class.". end if.
  if level is 11. return "Use: write TEXT to file NAME. let x be the content of file NAME.". end if.
  if level is 12. return "Use: let x be get URL. say x.". end if.
  if level is 13. return "Use: connect to database NAME as db. execute SQL on db.". end if.
  if level is 14. return "Use: use gui. open a window. create a label. show window.". end if.
  if level is 15. return "Combine: define, a list of, for each, if/else.". end if.
  return "Think carefully and try your best!".
end define.

define get_example taking level.
  if level is 1. return "say \"Hello, Quill!\".". end if.
  if level is 2. return "let name be \"Alice\".\nsay \"Hello, {name}!\".". end if.
  if level is 3. return "let result be 7 times 8.\nsay result.". end if.
  if level is 4. return "let age be 20.\nif age is at least 18.\n  say \"Welcome!\".\nelse.\n  say \"Sorry.\".\nend if.". end if.
  if level is 5. return "repeat 5 times.\n  say \"Echo!\".\nend repeat.". end if.
  if level is 6. return "define greet taking name.\n  say \"Hello, {name}!\".\nend define.\ngreet with \"World\".". end if.
  if level is 7. return "let colors be a list of \"red\", \"green\", \"blue\".\nfor each color in colors.\n  say color.\nend for.". end if.
  if level is 8. return "let p be a map with \"name\" as \"Alice\", \"age\" as 30.\nsay p at \"name\".\nsay p at \"age\".". end if.
  if level is 9. return "try.\n  raise error \"test\".\ncatch err.\n  say \"Caught: {err}\".\nend try.". end if.
  if level is 10. return "define class Dog.\n  it has name.\n  define create taking name.\n    set its name to name.\n  end define.\n  define speak.\n    say \"{its name} barks!\".\n  end define.\nend class.\nlet d be a new Dog with \"Rex\".\ncall speak on d.". end if.
  return "See the documentation for help!".
end define.

define get_badge taking level.
  if level is 1. return "First Words". end if.
  if level is 2. return "Memory Keeper". end if.
  if level is 3. return "Number Cruncher". end if.
  if level is 4. return "Logic Master". end if.
  if level is 5. return "Loop Rider". end if.
  if level is 6. return "Spell Weaver". end if.
  if level is 7. return "List Keeper". end if.
  if level is 8. return "Codex Reader". end if.
  if level is 9. return "Error Handler". end if.
  if level is 10. return "Golem Maker". end if.
  if level is 11. return "Scribe". end if.
  if level is 12. return "Net Hawk". end if.
  if level is 13. return "Vault Keeper". end if.
  if level is 14. return "Window Maker". end if.
  if level is 15. return "Quill Master". end if.
  return "Adventurer".
end define.

define get_points taking level.
  if level is at most 5. return 10. end if.
  if level is at most 10. return 25. end if.
  if level is at most 14. return 40. end if.
  return 100.
end define.

note ── Game functions ──────────────────────────────────────────────

define update_display.
  let story be get_story with current_level.
  let challenge be get_challenge with current_level.
  set the text of storyLabel to story.
  set the text of challengeLabel to "Challenge: {challenge}".
  set the text of scoreLabel to "Score: {total_score}".
  set the text of levelLabel to "Level {current_level} / {total_levels}".
  let progress_pct be current_level minus 1 times 100 divided by total_levels.
  set progress of questProgress to progress_pct.
  set the text of progressLabel to "Progress: {progress_pct}%".
  set the text of resultLabel to "".
  set the text of feedbackLabel to "".
  set the text of hintLabel to "Press the Hint button for help!".
  set the text of exampleLabel to "".
  let lives_display be "".
  if lives is at least 3. set lives_display to "Lives: ❤️❤️❤️". end if.
  if lives is 2. set lives_display to "Lives: ❤️❤️". end if.
  if lives is 1. set lives_display to "Lives: ❤️". end if.
  if lives is 0. set lives_display to "Lives: 💀". end if.
  set the text of livesLabel to lives_display.
  set attempts to 0.
end define.

define startGame.
  set game_started to yes.
  set current_level to 1.
  set total_score to 0.
  set lives to 3.
  set badges to an empty list.
  update_display.
  set the text of resultLabel to "Good luck, adventurer! Type your answer below.".
  show a toast saying "Quest started! Level 1: Hello World.".
end define.

define showHint.
  if game_started is no.
    show a toast saying "Start the quest first!".
    return.
  end if.
  let hint be get_hint with current_level.
  set the text of hintLabel to "Hint: {hint}".
  show a toast saying "Hint revealed!".
end define.

define showExample.
  if game_started is no.
    show a toast saying "Start the quest first!".
    return.
  end if.
  if lives is 0.
    show a toast saying "No lives left!".
    return.
  end if.
  subtract 1 from lives.
  let example be get_example with current_level.
  set the text of exampleLabel to "Example: {example}".
  let lives_display be "".
  if lives is at least 3. set lives_display to "Lives: ❤️❤️❤️". end if.
  if lives is 2. set lives_display to "Lives: ❤️❤️". end if.
  if lives is 1. set lives_display to "Lives: ❤️". end if.
  if lives is 0. set lives_display to "Lives: 💀". end if.
  set the text of livesLabel to lives_display.
  show a toast saying "Example shown! But it cost you a life.".
end define.

define submitAnswer.
  if game_started is no.
    show a toast saying "Press Start Quest first!".
    return.
  end if.
  let code be the value of codeInput.
  if code is "".
    show a toast saying "Please type your answer first!".
    return.
  end if.
  add 1 to attempts.
  note Check the answer
  let code_lower be code in lowercase.
  let challenge be get_challenge with current_level.
  let passed be yes.

  note Basic validation by level
  if current_level is 1.
    if code_lower contains "say" and code_lower contains "hello, quill".
      set passed to yes.
    else.
      set passed to no.
    end if.
  end if.

  if current_level is 2.
    if code_lower contains "let" and code_lower contains "be" and code_lower contains "say".
      set passed to yes.
    else.
      set passed to no.
    end if.
  end if.

  if current_level is 3.
    if code_lower contains "times" and code_lower contains "say".
      set passed to yes.
    else.
      set passed to no.
    end if.
  end if.

  if current_level is 4.
    if code_lower contains "if" and code_lower contains "at least" and code_lower contains "else".
      set passed to yes.
    else.
      set passed to no.
    end if.
  end if.

  if current_level is 5.
    if code_lower contains "repeat" and code_lower contains "times" and code_lower contains "end repeat".
      set passed to yes.
    else.
      set passed to no.
    end if.
  end if.

  if current_level is 6.
    if code_lower contains "define" and code_lower contains "taking" and code_lower contains "end define".
      set passed to yes.
    else.
      set passed to no.
    end if.
  end if.

  if current_level is 7.
    if code_lower contains "a list of" and code_lower contains "for each" and code_lower contains "end for".
      set passed to yes.
    else.
      set passed to no.
    end if.
  end if.

  if current_level is 8.
    if code_lower contains "a map with" and code_lower contains "as" and code_lower contains "at".
      set passed to yes.
    else.
      set passed to no.
    end if.
  end if.

  if current_level is 9.
    if code_lower contains "try" and code_lower contains "catch" and code_lower contains "end try".
      set passed to yes.
    else.
      set passed to no.
    end if.
  end if.

  if current_level is 10.
    if code_lower contains "define class" and code_lower contains "it has" and code_lower contains "end class".
      set passed to yes.
    else.
      set passed to no.
    end if.
  end if.

  if current_level is 11.
    if code_lower contains "use files" and code_lower contains "write" and code_lower contains "to file".
      set passed to yes.
    else.
      set passed to no.
    end if.
  end if.

  if current_level is 12.
    if code_lower contains "get" and code_lower contains "say".
      set passed to yes.
    else.
      set passed to no.
    end if.
  end if.

  if current_level is 13.
    if code_lower contains "connect to database" and code_lower contains "execute" and code_lower contains "query".
      set passed to yes.
    else.
      set passed to no.
    end if.
  end if.

  if current_level is 14.
    if code_lower contains "use gui" and code_lower contains "open a window" and code_lower contains "show window".
      set passed to yes.
    else.
      set passed to no.
    end if.
  end if.

  if current_level is 15.
    if code_lower contains "define" and code_lower contains "a list of" and code_lower contains "for each" and code_lower contains "if".
      set passed to yes.
    else.
      set passed to no.
    end if.
  end if.

  if passed is yes.
    let pts be get_points with current_level.
    add pts to total_score.
    let badge be get_badge with current_level.
    add badge to badges.
    set the text of scoreLabel to "Score: {total_score}".
    set the text of resultLabel to "CORRECT! You earned {pts} points and the '{badge}' badge!".
    set the text of feedbackLabel to "Outstanding work, adventurer! Press Next Level to continue.".
    set the text of badgeLabel to "Badges: {badges joined by \", \"}".
    show a toast saying "Level {current_level} complete! +{pts} points".
  else.
    subtract 1 from lives.
    let lives_display be "".
    if lives is at least 3. set lives_display to "Lives: ❤️❤️❤️". end if.
    if lives is 2. set lives_display to "Lives: ❤️❤️". end if.
    if lives is 1. set lives_display to "Lives: ❤️". end if.
    if lives is 0. set lives_display to "Lives: 💀". end if.
    set the text of livesLabel to lives_display.

    if lives is 0.
      set the text of resultLabel to "Out of lives! Showing example now...".
      let example be get_example with current_level.
      set the text of exampleLabel to "Example answer: {example}".
      set lives to 3.
      show a toast saying "Lives restored! Study the example and try again.".
    else.
      set the text of resultLabel to "Not quite! You have {lives} lives left.".
      if attempts is at least 3.
        let hint be get_hint with current_level.
        set the text of hintLabel to "Auto-hint: {hint}".
      end if.
    end if.
  end if.
end define.

define nextLevel.
  if game_started is no.
    show a toast saying "Start the quest first!".
    return.
  end if.
  if current_level is total_levels.
    set the text of resultLabel to "CONGRATULATIONS! You are a Quill Master! Final score: {total_score}".
    set the text of feedbackLabel to "You have mastered the Quill programming language!".
    set progress of questProgress to 100.
    show a toast saying "You completed Quill Quest! Score: {total_score}".
    return.
  end if.
  add 1 to current_level.
  update_display.
  show a toast saying "Level {current_level} unlocked!".
end define.

note ── Show window ────────────────────────────────────────────────
show window.
