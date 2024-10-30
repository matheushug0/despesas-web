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
    <title>Cadastro de Despesa</title>
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
                Despesa "${despesa.getDescricao()}" foi adicionada com sucesso!
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
            <div class="col-lg-7 p-3 p-lg-5 pt-lg-3">
                <img class="d-block mx-auto mb-4" src="https://www.svgrepo.com/show/202656/finances-money.svg" alt=""
                     srcset="" width="72" height="72">
                <h1 class="display-4 fw-bold lh-1 text-body-emphasis">Controle suas finanças com facilidade</h1>
                <p class="lead">Tenha uma visão clara de seus gastos, acompanhe seu orçamento e tome decisões
                    financeiras mais inteligentes. Tudo em um só lugar.</p>
                <hr class="my-4">
                <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                    <a href="/controller?action=ListarDespesas">
                        <button type="button" class="btn btn-outline-info btn-lg px-4 me-sm-3 fw-bold">Lista de Despesas</button>
                    </a>
                </div>
            </div>
            <div class="col-md-10 mx-auto col-lg-5">
                <form class="p-4 p-md-5 border rounded-3 bg-body-tertiary" action="/controller" method="post">
                    <div class="form-floating mb-3">
                        <input class="form-control" type="text" name="descricao" id="floatingInput"
                               placeholder="Descrição da Despesa" required>
                        <label for="floatingInput">Descrição </label>
                    </div>
                    <div class="form-floating mb-3">
                        <input class="form-control" type="date" name="data" id="date" placeholder="Data" required>
                        <label for="date">Data</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input class="form-control" type="text" name="valor" id="price" placeholder="Valor"
                               oninput="formatCurrency(this)" required>
                        <label for="price">Preço</label>
                    </div>
                    <div class="form-floating mb-3">
                        <select class="form-select" name="categoria" id="category" required>
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
                        <input type="hidden" name="action" value="AdicionarDespesa">
                        <button type="submit" class="w-100 btn btn-lg btn-primary">Adicionar</button>
                        <c:if test="${despesa.getId() != null}">
                            <script>
                                document.addEventListener("DOMContentLoaded", function() {
                                    const myModal = new bootstrap.Modal(document.getElementById('myModal'));
                                    myModal.show();
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