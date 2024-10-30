<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt" data-bs-theme="dark">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./dist/bootstrap.min.css" rel="stylesheet">
    <script>
        function formatCurrency(input) {
            //Removendo caracteres não numéricos
            let value = input.value.replace(/\D/g, "");
            // Verifica se o valor é vazio
            if (value === "") {
                input.value = "";
                return;
            }
            //formatando para monetário
            value = (parseFloat(value) / 100).toFixed(2);
            //atualizando campo do input
            input.value = formatNumber(value);
        }

        function formatNumber(number) {
            return number.replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        }
    </script>
    <title>Alterar Despesa</title>
</head>
<body>
<!-- Modal HTML -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">Despesa Adicionada</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Despesa "${despesa.getDescricao()}" foi alterada com sucesso!
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>

<main>
    <div class="container col-xl-10 col-xxl-8 px-4 py-5">
        <div class="row align-items-center g-lg-5 py-5">
            <div class="col-md-10 mx-auto col-lg-5">
                <form class="p-4 p-md-5 border rounded-3 bg-body-tertiary" action="/controller" method="post">
                    <div class="form-floating mb-3">
                        <input class="form-control" type="text" name="descricao" id="floatingInput"
                               placeholder="Descrição da Despesa" value="${despesa.getDescricao()}" required>
                        <label for="floatingInput">Descrição </label>
                    </div>
                    <div class="form-floating mb-3">
                        <input class="form-control" type="date" name="data" id="date" placeholder="Data" value="${despesa.getData()}" required>
                        <label for="date">Data</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input class="form-control" type="text" name="valor" id="price" placeholder="Valor"
                               oninput="formatCurrency(this)" value="${despesa.getValor()}" required>
                        <label for="price">Preço</label>
                    </div>
                    <div class="form-floating mb-3">
                        <select class="form-select" name="categoria" id="category" value="${despesa.getCategoria().toString()}" required>
                            <option value="ALIMENTACAO">Alimentação</option>
                            <option value="EDUCACAO">Educação</option>
                            <option value="SAUDE">Saúde</option>
                            <option value="TRANSPORTE">Transporte</option>
                            <option value="MORADIA">Moradia</option>
                            <option value="OUTROS">Outros</option>
                        </select>
                        <label for="category">Categoria</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="hidden" name="action" value="AtualizarDespesa">
                        <input type="hidden" name="id" value="${despesa.getId()}">
                        <button type="submit" class="w-100 btn btn-lg btn-primary" id="modalBtn">Atualizar</button>
                        <c:if test="${update.getId() != null}">
                            <script>
                                document.addEventListener("DOMContentLoaded", function() {
                                    const myModal = new bootstrap.Modal(document.getElementById('myModal'));
                                    myModal.show();

                                    setTimeout(function() {
                                        window.location.href = "/controller?action=ListarDespesas"; // Substitua pelo seu URL
                                    }, 1000); // Ajuste o tempo conforme necessário
                                });
                            </script>
                        </c:if>
                    </div>
                </form>
            </div>
        </div>

    </div>

</main>
<script src="./dist/bootstrap.min.js"></script>
<script src="./dist/popper.min.js"></script>
</body>
</html>