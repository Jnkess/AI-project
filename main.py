import clips
import PySimpleGUI as sg

env = clips.Environment()
env.load("baza.clp")
env.run()
run = True
err = 0
while(run):
    decyzja_str = ""
    for fact in env.facts():
        if fact.template.name == 'decyzja':
            decyzja = str(fact[0]).split('.')
    for i in range(int(decyzja[1])):
        decyzja_str = decyzja_str + str(i + 1) + ". " + decyzja[2+int(decyzja[1])+i] + "  "
    if err == 0:
        layout = [[sg.Text(decyzja[0])],
                  [sg.Text(decyzja_str)],
                  [sg.Input(key='input')],
                  [sg.Button('Submit')]]
    if err == 1:2
        err_text = "Wybierz wartość od 1 do " + decyzja[1]
        layout = [[sg.Text(decyzja[0])],
                  [sg.Text(decyzja_str)],
                  [sg.Text(err_text)],
                  [sg.Input(key='input')],
                  [sg.Button('Submit')]]
    window = sg.Window('Drink after work', layout)

    event, values = window.read()
    if event == 'Submit':
        # get the value from the input field
        if len(values['input']) == 1:
            if 48 <= ord(values['input']) <= int(decyzja[1]) + 49:
                wybor = values['input']
                env.assert_string("(" + decyzja[int(wybor) + 1] + ")")
                err = 0
        else:
            err = 1
    if event in (None, sg.WIN_CLOSED):
        break
    env.run()
    window.close()
    for fact in env.facts():
        if fact.template.name == 'koniec':
            wynik = str(fact[0])
            run = False
            break
layout = [[sg.Text("_______________________________________________")],
          [sg.Text(wynik)],
          [sg.Text("_______________________________________________")],
          [sg.Button('Close')]]
window = sg.Window('Drink after work', layout)
while True:
    event, values = window.read()
    if event in (None, sg.WIN_CLOSED, 'Close'):
        break
