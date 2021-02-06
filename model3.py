from PySide2.QtCore import QAbstractListModel,QModelIndex,Slot
class itemModel(QAbstractListModel):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.items = [#{'name':"Orange",'colorCode':"orange"}
        ]
    def rowCount(self,parent=QModelIndex()):
        return len(self.items)
    @Slot(str,str)
    def addItem(self,name,colorCode):
        self.beginInsertRows(QModelIndex(),self.rowCount(),self.rowCount())
        self.items.append({'name':name,'colorCode':colorCode})
        self.endInsertRows()

