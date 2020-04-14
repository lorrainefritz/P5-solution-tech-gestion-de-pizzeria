
CREATE TABLE public.MeanOfPayment (
                meanOfPayment_id VARCHAR(255) NOT NULL,
                title VARCHAR(255) NOT NULL,
                CONSTRAINT meanofpayment_id PRIMARY KEY (meanOfPayment_id)
);


CREATE TABLE public.Status (
                status_id INTEGER NOT NULL,
                title VARCHAR(255) NOT NULL,
                CONSTRAINT status_id PRIMARY KEY (status_id)
);


CREATE TABLE public.Ingredients (
                ingredients_id INTEGER NOT NULL,
                title VARCHAR(255) NOT NULL,
                CONSTRAINT ingredients_id PRIMARY KEY (ingredients_id)
);


CREATE TABLE public.Article (
                article_id INTEGER NOT NULL,
                title VARCHAR(255) NOT NULL,
                description VARCHAR(255) NOT NULL,
                unitPrice REAL NOT NULL,
                CONSTRAINT article_id PRIMARY KEY (article_id)
);


CREATE TABLE public.Recipe (
                recipe_id INTEGER NOT NULL,
                title VARCHAR(255) NOT NULL,
                description VARCHAR(255) NOT NULL,
                article_id INTEGER NOT NULL,
                CONSTRAINT recipe_id PRIMARY KEY (recipe_id)
);


CREATE TABLE public.ArticleIngredient (
                articleIngredient_id INTEGER NOT NULL,
                article_id INTEGER NOT NULL,
                ingredients_id INTEGER NOT NULL,
                CONSTRAINT articleingredient_id PRIMARY KEY (articleIngredient_id)
);


CREATE TABLE public.Adress (
                adress_id INTEGER NOT NULL,
                title VARCHAR(255) NOT NULL,
                numberAndWay VARCHAR(255) NOT NULL,
                zipCode INTEGER NOT NULL,
                city VARCHAR(255) NOT NULL,
                phoneNumber INTEGER NOT NULL,
                adressComplements VARCHAR(255),
                CONSTRAINT id_adress PRIMARY KEY (adress_id)
);


CREATE TABLE public.Pizzeria (
                pizzeria_id INTEGER NOT NULL,
                adress_id INTEGER NOT NULL,
                CONSTRAINT id_pizzeria PRIMARY KEY (pizzeria_id)
);


CREATE TABLE public.Staff (
                staff_id INTEGER NOT NULL,
                login VARCHAR(255) NOT NULL,
                firstName VARCHAR(255) NOT NULL,
                lastName VARCHAR(255) NOT NULL,
                email VARCHAR(255) NOT NULL,
                password VARCHAR(255) NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                CONSTRAINT staff_id PRIMARY KEY (staff_id)
);


CREATE TABLE public.Role (
                role_id INTEGER NOT NULL,
                title VARCHAR(255) NOT NULL,
                staff_id INTEGER NOT NULL,
                CONSTRAINT role_id PRIMARY KEY (role_id)
);


CREATE TABLE public.Stock (
                stock_id INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                ingredients_id INTEGER NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                CONSTRAINT stock_id PRIMARY KEY (stock_id)
);


CREATE TABLE public.Client (
                client_id INTEGER NOT NULL,
                clientNumber INTEGER NOT NULL,
                login VARCHAR(255) NOT NULL,
                firstName VARCHAR(255) NOT NULL,
                lastName VARCHAR(255) NOT NULL,
                email VARCHAR(255) NOT NULL,
                password VARCHAR(255) NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                adress_id INTEGER NOT NULL,
                CONSTRAINT id_client PRIMARY KEY (client_id)
);


CREATE TABLE public.Orders (
                order_id INTEGER NOT NULL,
                creationDate DATE NOT NULL,
                client_id INTEGER NOT NULL,
                meanOfPayment_id VARCHAR(255) NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                CONSTRAINT order_id PRIMARY KEY (order_id)
);


CREATE TABLE public.Delivery (
                delivery_id INTEGER NOT NULL,
                order_id INTEGER NOT NULL,
                CONSTRAINT delivery_id PRIMARY KEY (delivery_id)
);


CREATE TABLE public.DeliveryStaff (
                deliveryStaff_id INTEGER NOT NULL,
                staff_id INTEGER NOT NULL,
                delivery_id INTEGER NOT NULL,
                CONSTRAINT deliverystaff_id PRIMARY KEY (deliveryStaff_id)
);


CREATE TABLE public.StatusOrder (
                statusOrder_id INTEGER NOT NULL,
                date DATE NOT NULL,
                status_id INTEGER NOT NULL,
                order_id INTEGER NOT NULL,
                CONSTRAINT statusorder_id PRIMARY KEY (statusOrder_id)
);


CREATE TABLE public.Payment (
                payment_id INTEGER NOT NULL,
                paymentDate DATE NOT NULL,
                totalPrice REAL NOT NULL,
                meanOfPayment_id VARCHAR(255) NOT NULL,
                order_id INTEGER NOT NULL,
                CONSTRAINT payment_id PRIMARY KEY (payment_id)
);


CREATE TABLE public.OrderLine (
                orderLine_id INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                order_id INTEGER NOT NULL,
                article_id INTEGER NOT NULL,
                CONSTRAINT orderline_id PRIMARY KEY (orderLine_id)
);


ALTER TABLE public.Orders ADD CONSTRAINT meanofpayment_order_fk
FOREIGN KEY (meanOfPayment_id)
REFERENCES public.MeanOfPayment (meanOfPayment_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Payment ADD CONSTRAINT meanofpayment_payment_fk
FOREIGN KEY (meanOfPayment_id)
REFERENCES public.MeanOfPayment (meanOfPayment_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.StatusOrder ADD CONSTRAINT status_statusorder_fk
FOREIGN KEY (status_id)
REFERENCES public.Status (status_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Stock ADD CONSTRAINT ingredients_stock_fk
FOREIGN KEY (ingredients_id)
REFERENCES public.Ingredients (ingredients_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ArticleIngredient ADD CONSTRAINT ingredients_articleingredient_fk
FOREIGN KEY (ingredients_id)
REFERENCES public.Ingredients (ingredients_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ArticleIngredient ADD CONSTRAINT article_articleingredient_fk
FOREIGN KEY (article_id)
REFERENCES public.Article (article_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Recipe ADD CONSTRAINT article_recipe_fk
FOREIGN KEY (article_id)
REFERENCES public.Article (article_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.OrderLine ADD CONSTRAINT article_orderline_fk
FOREIGN KEY (article_id)
REFERENCES public.Article (article_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Client ADD CONSTRAINT client_adress_fk
FOREIGN KEY (adress_id)
REFERENCES public.Adress (adress_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Pizzeria ADD CONSTRAINT adress_pizzeria_fk
FOREIGN KEY (adress_id)
REFERENCES public.Adress (adress_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Client ADD CONSTRAINT pizzeria_client_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Stock ADD CONSTRAINT pizzeria_stock_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Orders ADD CONSTRAINT pizzeria_order_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Staff ADD CONSTRAINT pizzeria_staff_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Role ADD CONSTRAINT staff_role_fk
FOREIGN KEY (staff_id)
REFERENCES public.Staff (staff_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DeliveryStaff ADD CONSTRAINT staff_deliverystaff_fk
FOREIGN KEY (staff_id)
REFERENCES public.Staff (staff_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Orders ADD CONSTRAINT client_order_fk
FOREIGN KEY (client_id)
REFERENCES public.Client (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.OrderLine ADD CONSTRAINT order_orderline_fk
FOREIGN KEY (order_id)
REFERENCES public.Orders (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Payment ADD CONSTRAINT order_payment_fk
FOREIGN KEY (order_id)
REFERENCES public.Orders (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.StatusOrder ADD CONSTRAINT order_statusorder_fk
FOREIGN KEY (order_id)
REFERENCES public.Orders (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Delivery ADD CONSTRAINT order_delivery_fk
FOREIGN KEY (order_id)
REFERENCES public.Orders (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DeliveryStaff ADD CONSTRAINT delivery_deliverystaff_fk
FOREIGN KEY (delivery_id)
REFERENCES public.Delivery (delivery_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
