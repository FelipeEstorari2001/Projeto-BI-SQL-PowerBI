ALTER TABLE Vendas
ADD CONSTRAINT FK_Vendas_Vendedores
FOREIGN KEY (VendedorID)
REFERENCES Vendedores(VendedorID);