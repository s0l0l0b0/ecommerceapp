<%--
  Created by IntelliJ IDEA.
  User: sololobo
  Date: 12/25/21
  Time: 2:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html>
<head>
    <title>Checkout</title>

    <style>

        $navy-blue: #013552;
        $rose-pink-dark: #d40b5e;
        $white: #fff;
        $black: #000;

        @mixin input($align) {
            width: 100%;
            padding-bottom: 5px;
            background-color: transparent;
            border-top: none;
            border-right: none;
            border-bottom: 2px solid rgba($white, 0.3);
            border-left: none;
            border-radius: 0;
            color: rgba($white, 0.3);
            font-size: 1em;
            transition: all 0.25s ease-in-out;
            appearance: none;

            @if ($align == 'centerText') {
                text-align: center;
            }

        &:focus,
        &:active,
        &--valid {
             color: $rose-pink-dark;
             border-bottom: 2px solid $rose-pink-dark;
         }
        }

        *,
        *:before,
        *:after {
            box-sizing: border-box;
        }

        html {
            font-size: 16px;
        }

        body {
            background: linear-gradient(to right, #f00f55 0%,#fa0f89 100%);
            font-family: 'Trebuchet MS', Helvetica, sans-serif;
            letter-spacing: 0.03em;
            text-rendering: optimizeLegibility;
            -webkit-font-smoothing: antialiased;
        }

        p, a {
            color: $white;
        }

        img {
            display: block;
            width: 100%;
        }

        select,
        input {
            font-family: 'Trebuchet MS', Helvetica, sans-serif;
            letter-spacing: 0.05em;
        }

        button {
            font-family: 'Trebuchet MS', Helvetica, sans-serif;
            letter-spacing: 0.03em;
        }

        .container {
            position: relative;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding-right: 15px;
            padding-left: 15px;
        }

        .product {
            width: 100%;
            max-width: 750px;
            margin-bottom: 15px;
        }

        .product__details {
            padding: 30px 25px;
            background-color: #012f43;
            color: $white;
        }

        .product__details-heading {
            margin-top: 0;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .product__details-sub-heading {
            display: block;
            margin-bottom: 20px;
            font-size: 1.4em;
            font-weight: bold;
        }

        .card-details {
            position: relative;
            padding: 25px;
            background: linear-gradient(to right, $navy-blue 0%, #00324e 100%);
            color: $white;
        }

        .card-details__fieldset {
            margin-top: 0;
            margin-right: 0;
            margin-bottom: 30px;
            margin-left: 0;
            padding: 0;
            border: none;
        }

        .card-details__heading {
            display: block;
            font-size: 0.95em;
            font-weight: bold;
        }

        .card-details__cards {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .card-details__cards-item {
            position: relative;
            width: 18%;
            max-width: 53px;
            border-radius: 5px;
            overflow: hidden;
        }

        .card-details__card-input {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            margin: 0;
            border: none;
            cursor: pointer;
            appearance: none;
            z-index: 1;
        }

        .card-details__card-label {
            position: absolute;
            top: 0;
            left: 0;
            width: 0;
            height: 0;
            text-indent: -9999px;
            z-index: 0;
        }

        .card-details__cards-image {
            border-radius: 5px;
            opacity: 0.2;
            transition: opacity 0.25s ease-in-out;

        .card-details__card-input:checked ~ &,
        .card-details__card-input:hover ~ &,
        .card-details__card-input:active ~ &,
        .card-details__card-input:focus ~ & {
            opacity: 1;
        }
        }

        .card-details__number {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-top: 15px;
        }

        .card-details__number-field {
            position: relative;
            width: 15%;
        }

        .card-details__number-card {
            width: 14%;
            margin-left: 10px;
            border-radius: 5px;
            overflow: hidden;
        }

        .card-details__number-label {
            position: absolute;
            top: 0;
            left: 0;
            width: 0;
            height: 0;
            text-indent: -9999px;
            clip: rect(0, 0, 0);
        }

        .card-details__number-input,
        .card-details__expiration-date-input,
        .card-details__security-code-input {
            @include input('centerText');
        }

        .card-details__holder {
            position: relative;
            margin-top: 10px;
        }

        .card-details__holder-label,
        .card-details__expiration-date-label,
        .card-details__security-code-label {
            position: absolute;
            top: 0;
            left: 0;
            width: 0;
            height: 0;
            text-indent: -9999px;
            clip: rect(0, 0, 0);
        }

        .card-details__holder-input {
            @include input(null);
        }

        .card-details__expiration,
        .card-details__security {
            display: inline-block;
            vertical-align: middle;
        }

        .card-details__expiration {
            margin-right: 50px;
        }

        .card-details__expiration-date {
            position: relative;
            max-width: 66px;
            margin-top: 15px;
        }

        .card-details__details__security-code {
            position: relative;
            max-width: 29px;
            margin-top: 15px;
        }

        .card-details__submit {
            display: block;
            width: 100%;
            background: radial-gradient(ellipse at center, #f93090 0%, #f10052 100%);
            background-position: center;
            background-repeat: no-repeat;
            color: $white;
            border: none;
            border-radius: 0;
            padding: 16px 35px;
            font-size: 1em;
            font-weight: bold;
            text-align: center;
            cursor: pointer;
            appearance: none;
        }

        .product__details-basket {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
        }

        .product__details-basket-heading {
            display: block;
            margin-bottom: 10px;
            color: rgba($white, 0.7);
            font-size: 0.95em;

        &--right {
             text-align: right;
         }
        }

        .product__details-basket-quantity-wrapper {
            position: relative;
            background-color: #013552;

        &:before {
             content: '\203A';
             position: absolute;
             top: 50%;
             right: 6px;
             font-family: 'Trebuchet MS', Helvetica, sans-serif;
             color: rgba($white, 0.7);
             font-size: 1.8em;
             transform: rotate(90deg) translateY(-50%);
             transform-origin: top;
         }
        }

        .product__details-basket-quantity {
            display: block;
            position: relative;
            width: 100%;
            background-color: transparent;
            margin: 0;
            padding: 6px 12px;
            border: none;
            border-radius: 0;
            color: $white;
            font-size: 1em;
            appearance: none;
            z-index: 1;
        }

        .product__details-basket-price {
            display: block;
            color: $rose-pink-dark;
            font-size: 1.3em;
            font-weight: bold;
        }

        @media screen and (min-width: 40em) {
            html,
            body {
                position: relative;
                width: 100%;
                height: 100%;
            }

            .product__details-heading {
                font-size: 1.7em;
            }

            .card-details {
                padding-right: 50px;
                padding-bottom: 35px;
                padding-left: 50px;
            }

            .card-details__holder {
                width: calc(80% - 10px);
            }
        }

        @media screen and (min-width: 47.938em) {
            .product {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .product__details {
                position: relative;
                padding-top: 40px;
                padding-bottom: 40px;
                flex: 1;
                box-shadow: 0px 0px 15px 8px rgba($black, 0.35);
                z-index: 1;
            }

            .product__details-sub-heading {
                margin-bottom: 60px;
            }

            .product__details-image-wrapper {
                position: relative;
                margin-bottom: 40%;
                padding-top: 56.25%;
            }

            .product__details-image {
                position: absolute;
                top: 50%;
                left: 50%;
                width: 175%;
                height: 175%;
                transform: rotate(-5deg) translate(-50%, -50%);
                transform-origin: 50%;
                z-index: 1;
            }

            .card-details {
                max-width: 450px;
                box-shadow: 0px 0px 15px 8px rgba($black, 0.35);
            }

            .card-details__submit {
                position: absolute;
                right: 20px;
                bottom: -25px;
                width: auto;
                box-shadow: 0px 0px 15px 5px rgba($black, 0.35);
            }

            .card-details__fieldset {
        &:last-of-type {
             margin-bottom: 0;
         }
        }
        }

    </style>
</head>
<body>

<div class="container">
    <section class="product">
        <div class="product__details">
            <h1 class="product__details-heading">DJI Phantom</h1>
            <span class="product__details-sub-heading">P3 Standard</span>

            <div class="product__details-image-wrapper">
                <img class="product__details-image" src="https://image.ibb.co/nFfzRK/phantom_3_standard.png" alt="">
            </div>

            <div class="product__details-basket">
                <div class="product__details-basket-item">
                    <span class="product__details-basket-heading">Quantity</span>
                    <div class="product__details-basket-quantity-wrapper">
                        <select class="product__details-basket-quantity" name="quantity" id="quantity" data-product-quantity>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div>

                <div class="product__details-basket-item">
                    <span class="product__details-basket-heading product__details-basket-heading--right">Price</span>
                    <span class="product__details-basket-price" data-product-price>$386.78</span>
                </div>
            </div>
        </div>

        <form class="card-details" action="" data-form>
            <fieldset class="card-details__fieldset">
                <span class="card-details__heading">Card Type</span>

                <div class="card-details__cards" data-card-types>
                    <div class="card-details__cards-item">
                        <input class="card-details__card-input" type="radio" name="cardType" id="visa" data-card-type="visa" checked>
                        <label class="card-details__card-label" for="visa">Visa</label>
                        <img class="card-details__cards-image" src="https://svgshare.com/i/7h2.svg" alt="Visa Card" aria-hidden="true">
                    </div>

                    <div class="card-details__cards-item">
                        <input class="card-details__card-input" type="radio" name="cardType" id="mastercard" data-card-type="mastercard">
                        <label class="card-details__card-label" for="mastercard">MasterCard</label>
                        <img class="card-details__cards-image" src="https://svgshare.com/i/7fu.svg" alt="MasterCard" aria-hidden="true">
                    </div>

                    <div class="card-details__cards-item">
                        <input class="card-details__card-input" type="radio" name="cardType" id="discover" data-card-type="discover">
                        <label class="card-details__card-label" for="discover">Discover</label>
                        <img class="card-details__cards-image" src="https://svgshare.com/i/7hP.svg" alt="Discover Card" aria-hidden="true">
                    </div>

                    <div class="card-details__cards-item">
                        <input class="card-details__card-input" type="radio" name="cardType" id="express" data-card-type="express">
                        <label class="card-details__card-label" for="express">American Express</label>
                        <img class="card-details__cards-image" src="https://svgshare.com/i/7gD.svg" alt="Amercican Express Card" aria-hidden="true">
                    </div>
                </div>
            </fieldset>

            <fieldset class="card-details__fieldset">
                <span class="card-details__heading">Card Number</span>

                <div class="card-details__number">
                    <div class="card-details__number-field">
                        <label for="cardNumberFirstFour" class="card-details__number-label">First Four Digits</label>
                        <input class="card-details__number-input" type="text" maxlength="4" name="card-number" value="0000" id="cardNumberFirstFour" data-input>
                    </div>

                    <div class="card-details__number-field">
                        <label for="cardNumberSecondFour" class="card-details__number-label">Second Four Digits</label>
                        <input class="card-details__number-input" type="text" maxlength="4" name="card-number" value="0000" id="cardNumberSecondFour" data-input>
                    </div>

                    <div class="card-details__number-field">
                        <label for="cardNumberThirdFour" class="card-details__number-label">Third Four Digits</label>
                        <input class="card-details__number-input" type="text" maxlength="4" name="card-number" value="0000" id="cardNumberThirdFour" data-input>
                    </div>

                    <div class="card-details__number-field">
                        <label for="cardNumberFirstFour" class="card-details__number-label">Last Four Digits</label>
                        <input class="card-details__number-input" type="text" maxlength="4" name="card-number" value="0000" id="cardNumberLastFour" data-input>
                    </div>

                    <div class="card-details__number-card">
                        <img class="card-details__number-card-image" src="https://svgshare.com/i/7h2.svg" alt="Visa Card" data-card-image>
                    </div>
                </div>
            </fieldset>

            <fieldset class="card-details__fieldset">
                <span class="card-details__heading" aria-hidden="true">Card Holder Name</span>
                <div class="card-details__holder">
                    <label class="card-details__holder-label" for="cardHolderName">Card Holder Name</label>
                    <input class="card-details__holder-input" type="text" id="cardHolderName" data-input>
                </div>
            </fieldset>

            <fieldset class="card-details__fieldset">
                <div class="card-details__expiration">
                    <span class="card-details__heading" aria-hidden="true">Expiration Date</span>
                    <div class="card-details__expiration-date">
                        <label class="card-details__expiration-date-label" for="expirationDate">Expiration Date</label>
                        <input class="card-details__expiration-date-input" type="text" maxlength="7" value="MM / YY" id="expirationDate" data-input>
                    </div>
                </div>

                <div class="card-details__security">
                    <span class="card-details__heading" aria-hidden="true">CVV</span>
                    <div class="card-details__details__security-code">
                        <label class="card-details__security-code-label" for="expirationDate">CVV</label>
                        <input class="card-details__security-code-input" type="text" maxlength="3" value="000" id="expirationDate" data-input>
                    </div>
                </div>
            </fieldset>

            <button class="card-details__submit" type="button" data-submit-button>Purchase</button>
        </form>
    </section>

    <p>Design by <a href="https://dribbble.com/AmandaLumleyx">Amanda Lumley</a> via <a href="https://dribbble.com/shots/3237318-Daily-UI-002-Credit-Card-Checkout">Dribble</a></p>
</div>

<script>
    function ValidationModule({ form, inputs, submit }) {
        const state = {
            form,
            inputs,
            submit
        };

        function focus({ target }) {
            if (target.defaultValue === target.value) {
                target.value = '';
            }
        }

        function blur({ target }) {
            const defaultClassName = target.className.split(' ')[0];

            if (target.value === '') {
                target.value = target.defaultValue;
                target.className = defaultClassName;
                return;
            }

            target.className = `${defaultClassName} ${defaultClassName}--valid`;
        }

        function delegateEvent(event) {
            if (event.target.nodeName !== 'INPUT') {
                return;
            }

            if (event.type === 'focus') {
                return focus(event);
            }

            if (event.type === 'blur') {
                return blur(event);
            }
        }

        function bindEvents() {
            form.addEventListener('focus', delegateEvent, true);
            form.addEventListener('blur', delegateEvent, true);
        }

        return {
            bindEvents
        }
    }



    function checkoutForm() {
        const form = document.querySelector('[data-form]');
        const quantity = document.querySelector('[data-product-quantity]');
        const cardTypes = form.querySelector('[data-card-types]');
        const data = {
            form,
            inputs: form.querySelectorAll('[data-input]'),
            submit: form.querySelector('[data-submit]')
        };

        function togglePriceChange({ target }) {
            const value = parseInt(target.value, 10);
            const initialPrice = 386.78;
            const price = document.querySelector('[data-product-price]');
            const newPrice = initialPrice * value;

            price.textContent = `$${newPrice.toFixed(2)}`;
        }

        function toggleCardType({ target }) {
            const cardImage = form.querySelector('[data-card-image]');
            const cardTypeValue = target.getAttribute('data-card-type');
            const cardPath = 'https://svgshare.com/i/';
            const cardTypeData = {
                visa: { src: `${cardPath}7h2.svg`, alt: 'Visa Card' },
                mastercard: { src: `${cardPath}7fu.svg`, alt: 'MasterCard' },
                discover: { src: `${cardPath}7hP.svg`, alt: 'Discover Card' },
                express: { src: `${cardPath}7gD.svg`, alt: 'American Express Card' }
            }

            if (cardTypeData.hasOwnProperty(cardTypeValue)) {
                const data = Object.getOwnPropertyDescriptor(cardTypeData, cardTypeValue);

                cardImage.src = data.value.src;
                cardImage.alt = data.value.alt;
            }
        }

        function init() {
            const validation = new ValidationModule(data);

            quantity.addEventListener('change', togglePriceChange);
            cardTypes.addEventListener('click', toggleCardType);
            validation.bindEvents();
        }

        init();
    }

    checkoutForm();

</script>
</body>
</html>
