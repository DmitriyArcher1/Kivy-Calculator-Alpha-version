from kivy.app import App

from kivy.uix.gridlayout import GridLayout
from kivy.uix.button import Button
from kivy.uix.label import Label
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.widget import Widget

from kivy.config import Config

Config.set('graphics', 'resizable', 0)
Config.set('graphics', 'width', 400)
Config.set('graphics', 'height', 500)

class TestApp(App):
    def update_label(self):
        self.lbl.text = self.formula

    def add_number(self, instance):
        if(self.formula == "0"):
            self.formula = ""
        self.formula += str(instance.text)
        self.update_label()

    def add_operation(self, instance):
        if(str(instance.text).lower() == "x"):
            self.formula += "*"
        else:
            self.formula += str(instance.text)

        self.update_label()

    def calc_result(self, instance):
        self.lbl.text = str(eval(self.lbl.text))

    def reset(self, instance):
        self.formula = "0"
        self.update_label()

    def build(self):
        self.formula = "0"
        bl = BoxLayout(orientation = 'vertical', padding = 20)
        gl = GridLayout(cols = 4, spacing = 2, size_hint = (1, .6))

        self.lbl = Label(text = '0', font_size = 40, valign = "center", halign = "right", size_hint = (1, .4), text_size = (400 - 40, 500 * .4 - 40))
        bl.add_widget(self.lbl)

        gl.add_widget(Button(text = "7", on_press = self.add_number, background_color = 'cyan'))
        gl.add_widget(Button(text = "8", on_press = self.add_number, background_color = 'cyan'))
        gl.add_widget(Button(text = "9", on_press = self.add_number, background_color = 'cyan'))
        gl.add_widget(Button(text = "X", on_press = self.add_operation, background_color = 'cyan'))

        gl.add_widget(Button(text = "4", on_press = self.add_number, background_color='cyan'))
        gl.add_widget(Button(text = "5", on_press = self.add_number, background_color='cyan'))
        gl.add_widget(Button(text = "6", on_press = self.add_number, background_color='cyan'))
        gl.add_widget(Button(text = "-", on_press = self.add_operation, background_color='cyan'))

        gl.add_widget(Button(text="1", on_press = self.add_number, background_color='cyan'))
        gl.add_widget(Button(text="2", on_press = self.add_number, background_color='cyan'))
        gl.add_widget(Button(text="3", on_press = self.add_number, background_color='cyan'))
        gl.add_widget(Button(text="+", on_press = self.add_operation, background_color='cyan'))

        gl.add_widget(Button(text="+/-", on_press = self.add_operation, background_color='cyan'))
        gl.add_widget(Button(text="0", on_press = self.add_number, background_color='cyan'))
        gl.add_widget(Button(text=".", on_press = self.add_operation, background_color='cyan'))
        gl.add_widget(Button(text="=", on_press = self.calc_result, background_color='cyan'))

        gl.add_widget(Widget())
        gl.add_widget(Widget())
        gl.add_widget(Button(text="C", on_press=self.reset, background_color='cyan'))
        gl.add_widget(Button(text = "/", on_press = self.add_operation, background_color = "cyan"))

        bl.add_widget(gl)
        return bl

if __name__ == '__main__':
    TestApp().run()
