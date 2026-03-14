"""
Quill Quest Engine — Python backend for the teaching game.
The game UI is driven by Quill code, but some game-state
logic lives here for efficiency and reliability.
"""

LEVELS = [
    # ── LEVEL 1: Hello World ───────────────────────────────────────
    {
        'id': 1, 'category': 'Basics', 'difficulty': 'Beginner',
        'title': 'Your First Words',
        'story': 'The ancient Quill Oracle speaks only in plain English. To awaken it, you must speak its greeting.',
        'challenge': 'Write a line that prints: Hello, Quill!',
        'hint': 'In Quill you print things with the word "say" followed by text in quotes, ending with a period.',
        'example': 'say "Hello, Quill!".',
        'solution_contains': ['say', 'hello, quill'],
        'points': 10,
        'badge': 'First Words',
    },
    # ── LEVEL 2: Variables ─────────────────────────────────────────
    {
        'id': 2, 'category': 'Basics', 'difficulty': 'Beginner',
        'title': 'Naming Things',
        'story': 'The Oracle needs to remember your name. Teach it how to store information.',
        'challenge': 'Store your name in a variable called "name" and print: Hello, [your name]!',
        'hint': 'Use "let name be" to create a variable, then "say" with {name} in your message.',
        'example': 'let name be "Alice".\nsay "Hello, {name}!".',
        'solution_contains': ['let', 'be', 'say'],
        'points': 15,
        'badge': 'Memory Keeper',
    },
    # ── LEVEL 3: Numbers ──────────────────────────────────────────
    {
        'id': 3, 'category': 'Basics', 'difficulty': 'Beginner',
        'title': 'The Math Gate',
        'story': 'A magical gate is locked by arithmetic. Calculate 7 times 8 to open it.',
        'challenge': 'Create a variable "result" that equals 7 times 8, then print it.',
        'hint': 'In Quill, multiplication uses the word "times". No * symbols!',
        'example': 'let result be 7 times 8.\nsay result.',
        'solution_contains': ['let', 'times', 'say'],
        'points': 15,
        'badge': 'Number Cruncher',
    },
    # ── LEVEL 4: Conditions ────────────────────────────────────────
    {
        'id': 4, 'category': 'Logic', 'difficulty': 'Beginner',
        'title': 'The Gatekeeper',
        'story': 'A gatekeeper only lets adults through. Write the check.',
        'challenge': 'If age is 18 or older, say "Welcome!". Otherwise say "Sorry, come back later."',
        'hint': 'Use "if ... is at least ... else ... end if." structure.',
        'example': 'let age be 20.\nif age is at least 18.\n  say "Welcome!".\nelse.\n  say "Sorry.".\nend if.',
        'solution_contains': ['if', 'at least', 'else', 'end if'],
        'points': 20,
        'badge': 'Logic Master',
    },
    # ── LEVEL 5: Loops ────────────────────────────────────────────
    {
        'id': 5, 'category': 'Loops', 'difficulty': 'Beginner',
        'title': 'The Echo Chamber',
        'story': 'The Echo Chamber repeats sounds. Make it say "Echo!" five times.',
        'challenge': 'Use a repeat loop to print "Echo!" exactly 5 times.',
        'hint': 'Use "repeat N times." with a body and "end repeat."',
        'example': 'repeat 5 times.\n  say "Echo!".\nend repeat.',
        'solution_contains': ['repeat', 'times', 'say', 'end repeat'],
        'points': 20,
        'badge': 'Loop Rider',
    },
    # ── LEVEL 6: Functions ────────────────────────────────────────
    {
        'id': 6, 'category': 'Functions', 'difficulty': 'Intermediate',
        'title': 'The Spell Factory',
        'story': 'Mages store their spells as reusable incantations. Create one.',
        'challenge': 'Define a function "greet" that takes a "name" and prints "Greetings, [name]!"',
        'hint': 'Use "define greet taking name." then "end define." and call it with "greet with name."',
        'example': 'define greet taking name.\n  say "Greetings, {name}!".\nend define.\ngreet with "World".',
        'solution_contains': ['define', 'taking', 'say', 'end define'],
        'points': 25,
        'badge': 'Spell Weaver',
    },
    # ── LEVEL 7: Lists ────────────────────────────────────────────
    {
        'id': 7, 'category': 'Data', 'difficulty': 'Intermediate',
        'title': 'The Treasure Chest',
        'story': 'A treasure chest holds multiple items. Create a list and explore it.',
        'challenge': 'Create a list of 3 colors, then print each one using a for each loop.',
        'hint': 'Use "let colors be a list of ..." then "for each color in colors." loop.',
        'example': 'let colors be a list of "red", "green", "blue".\nfor each color in colors.\n  say color.\nend for.',
        'solution_contains': ['a list of', 'for each', 'in', 'end for'],
        'points': 25,
        'badge': 'List Keeper',
    },
    # ── LEVEL 8: Maps ────────────────────────────────────────────
    {
        'id': 8, 'category': 'Data', 'difficulty': 'Intermediate',
        'title': 'The Ancient Codex',
        'story': 'The Codex stores knowledge as key-value pairs. Learn to read and write it.',
        'challenge': 'Create a map with "name" and "age" keys, then print both values.',
        'hint': 'Use "a map with KEY as VALUE, KEY as VALUE" and access with "map at KEY".',
        'example': 'let person be a map with "name" as "Alice", "age" as 30.\nsay person at "name".\nsay person at "age".',
        'solution_contains': ['a map with', 'as', 'at'],
        'points': 30,
        'badge': 'Codex Reader',
    },
    # ── LEVEL 9: Error Handling ───────────────────────────────────
    {
        'id': 9, 'category': 'Advanced', 'difficulty': 'Intermediate',
        'title': 'The Safety Net',
        'story': 'Even brave adventurers need protection. Handle errors gracefully.',
        'challenge': 'Write a try/catch block that catches any error and prints "Caught: [error message]"',
        'hint': 'Use "try." ... "catch error." ... "end try." structure.',
        'example': 'try.\n  raise error "Oops!".\ncatch err.\n  say "Caught: {err}".\nend try.',
        'solution_contains': ['try', 'catch', 'end try'],
        'points': 30,
        'badge': 'Error Handler',
    },
    # ── LEVEL 10: Classes ─────────────────────────────────────────
    {
        'id': 10, 'category': 'Advanced', 'difficulty': 'Advanced',
        'title': 'The Golem Maker',
        'story': 'Mages create Golems — objects that hold data and behaviour. Build one.',
        'challenge': 'Create a class "Animal" with name and sound, a create method, and a speak method.',
        'hint': 'Use "define class Animal." with "it has name, sound." and method definitions.',
        'example': 'define class Animal.\n  it has name, sound.\n  define create taking name, sound.\n    set its name to name.\n    set its sound to sound.\n  end define.\n  define speak.\n    say "{its name} says {its sound}!".\n  end define.\nend class.\nlet cat be a new Animal with "Cat", "Meow".\ncall speak on cat.',
        'solution_contains': ['define class', 'it has', 'define create', 'end class'],
        'points': 50,
        'badge': 'Golem Maker',
    },
    # ── LEVEL 11: File I/O ────────────────────────────────────────
    {
        'id': 11, 'category': 'Files', 'difficulty': 'Intermediate',
        'title': 'The Scribe',
        'story': 'The Royal Scribe records everything to parchment (files). Learn to write and read.',
        'challenge': 'Write "Hello File!" to a file called "scroll.txt", then read it back and print it.',
        'hint': 'Use "write ... to file ..." to write and "let x be the content of file ..." to read.',
        'example': 'use files.\nwrite "Hello File!" to file "scroll.txt".\nlet content be the content of file "scroll.txt".\nsay content.\ndelete file "scroll.txt".',
        'solution_contains': ['use files', 'write', 'to file', 'content of file'],
        'points': 30,
        'badge': 'Scribe',
    },
    # ── LEVEL 12: HTTP ────────────────────────────────────────────
    {
        'id': 12, 'category': 'Web', 'difficulty': 'Advanced',
        'title': 'The Messenger Hawk',
        'story': 'Messenger hawks carry information across the internet. Send your first request.',
        'challenge': 'Fetch data from "https://api.ipify.org" and print your IP address.',
        'hint': 'Use "let response be get URL." then say the response.',
        'example': 'let response be get "https://api.ipify.org".\nsay "My IP: {response}".',
        'solution_contains': ['let', 'be get', 'say'],
        'points': 40,
        'badge': 'Net Hawk',
    },
    # ── LEVEL 13: Database ────────────────────────────────────────
    {
        'id': 13, 'category': 'Database', 'difficulty': 'Advanced',
        'title': 'The Vault Keeper',
        'story': 'The Vault Keeper stores data forever. Learn to use the database.',
        'challenge': 'Connect to a database, create a table, insert a row, and query it back.',
        'hint': 'Use "connect to database", "execute SQL on db", and "query db with SQL".',
        'example': 'connect to database "test.db" as db.\nexecute "CREATE TABLE t (name TEXT)" on db.\nexecute "INSERT INTO t VALUES (?)" on db with a list of "Alice".\nlet rows be query db with "SELECT name FROM t".\nfor each row in rows.\n  say row at "name".\nend for.',
        'solution_contains': ['connect to database', 'execute', 'query'],
        'points': 50,
        'badge': 'Vault Keeper',
    },
    # ── LEVEL 14: GUI ─────────────────────────────────────────────
    {
        'id': 14, 'category': 'GUI', 'difficulty': 'Advanced',
        'title': 'The Window Maker',
        'story': 'Master window makers craft beautiful interfaces. Build your first window.',
        'challenge': 'Create a GUI window with a label saying "Hello GUI!" and show it.',
        'hint': 'Use gui module, open a window, create a label, and call show window.',
        'example': 'use gui.\nset theme to "dark".\nopen a window titled "My App" with width 400, height 300.\ncreate a label named myLabel saying "Hello GUI!".\nplace myLabel in window.\nshow window.',
        'solution_contains': ['use gui', 'open a window', 'create a label', 'show window'],
        'points': 60,
        'badge': 'Window Maker',
    },
    # ── LEVEL 15: Grand Finale ────────────────────────────────────
    {
        'id': 15, 'category': 'Mastery', 'difficulty': 'Master',
        'title': 'The Quill Master',
        'story': 'You have learned all the arts of Quill. Combine everything for the final challenge.',
        'challenge': 'Create a program that: defines a function, uses a list, has a condition, and prints a summary.',
        'hint': 'Combine: define a function, create a list, loop with conditions, print results.',
        'example': 'define check taking n.\n  if n is greater than 5.\n    return "big".\n  else.\n    return "small".\n  end if.\nend define.\nlet numbers be a list of 3, 7, 2, 9, 1.\nfor each n in numbers.\n  let size be check with n.\n  say "{n} is {size}".\nend for.',
        'solution_contains': ['define', 'a list of', 'for each', 'if'],
        'points': 100,
        'badge': 'Quill Master',
    },
]


def get_levels():
    return LEVELS

def get_level(level_id):
    for level in LEVELS:
        if level['id'] == int(level_id):
            return level
    return None

def check_solution(level_id, code):
    level = get_level(level_id)
    if not level:
        return False, "Level not found"
    code_lower = code.lower()
    for keyword in level['solution_contains']:
        if keyword.lower() not in code_lower:
            return False, f'Missing: {keyword}'
    # Try to actually run the code
    import sys, os
    sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', '..'))
    try:
        from quill.evaluator import run_string
        run_string(code)
        return True, "Correct!"
    except Exception as e:
        return False, str(e)

