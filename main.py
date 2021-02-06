# This Python file uses the following encoding: utf-8
import sys
import os
import datetime
import model3
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject,Slot,Signal,QTimer

class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.setTime())
        self.timer.start(1000)
        self.mod = model3.itemModel()
        self.mod.addItem('red','red')
#        engine.rootContext().setContextProperty('itemModel',mod)

    setName = Signal(str)
    printTime = Signal(str)
    def setTime(self):
        now = datetime.datetime.now()
        formatDate = now.strftime("Now is %H:%M:%S %p of %Y/%m/%d")
        self.printTime.emit(formatDate)
    @Slot(str)
    def welcomeText(self,name):
        self.setName.emit("Welcome , "+name)

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine("C:\\Users\\Javad\\Documents\\simpleBtn\\main.qml")
    main = MainWindow()
    engine.rootContext().setContextProperty('backend',main)
#    engine.load(os.path.join(os.path.dirname(__file__), "main.qml"))
    engine.rootContext().setContextProperty("prop", "we entered")
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
    
