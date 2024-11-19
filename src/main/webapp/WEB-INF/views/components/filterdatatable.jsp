<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
    <c:when test="${not empty filterProducts}">
        <c:forEach var="product" items="${filterProducts}">
            <tr class="row ms-0 me-0">
                <td class="col-sm-4">${product.name}</td>
                <td class="col-sm-4">${product.price}</td>
                <td class="col-sm-4">
                    <img src="${product.imageUrl}" alt="${product.name}" style="width: 50px; height: 50px;">
                </td>
            </tr>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <tr>
            <td colspan="3" class="text-center">No products found</td>
        </tr>
    </c:otherwise>
</c:choose>
