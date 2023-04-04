CREATE TABLE `productlines` (
  `productLine` int,
  `textDescription` text,
  `htmlDescription` text,
  `image` varchar(255)
);

CREATE TABLE `products` (
  `productName` int,
  `productLine` varchar(255),
  `productScale` varchar(255),
  `productVendor` varchar(255),
  `productDescription` text,
  `quantitylnStock` varchar(255),
  `buyPrice` int,
  `MSRP` varchar(255)
);

CREATE TABLE `orderDetails` (
  `orderNumber` int,
  `productCode` int,
  `quantityOrdered` int,
  `priceEach` int,
  `orderLineNumber` int
);

CREATE TABLE `orders` (
  `orderNumber` int,
  `orderDate` int,
  `requiredDate` int,
  `shippedDate` int,
  `status` int,
  `comments` int,
  `customerNumber` int
);

CREATE TABLE `customers` (
  `customerNumber` int,
  `customerName` varchar(255),
  `contactLastName` int,
  `contactFirstName` varchar(255),
  `phone` int,
  `addressLine1` varchar(255),
  `addressLine2` varchar(255),
  `city` varchar(255),
  `state` varchar(255),
  `postalCode` int,
  `country` varchar(255),
  `salesRepEmployeeNumber` int,
  `creditLimit` int
);

CREATE TABLE `payments` (
  `customerNumber` int,
  `checkNumber` int,
  `paymentDate` int,
  `amount` int
);

CREATE TABLE `employees` (
  `employeesNumber` int,
  `lastName` varchar(255),
  `firstName` varchar(255),
  `extebsion` varchar(255),
  `email` varchar(255),
  `officeCode` int,
  `reportsTo` varchar(255),
  `jobTitle` varchar(255)
);

CREATE TABLE `offices` (
  `officeCode` int,
  `city` varchar(255),
  `phone` int,
  `addressLine1` varchar(255),
  `addressLine2` varchar(255),
  `state` varchar(255),
  `country` varchar(255),
  `postalCode` int,
  `territory` varchar(255)
);

ALTER TABLE `products` ADD FOREIGN KEY (`productLine`) REFERENCES `productlines` (`htmlDescription`);

ALTER TABLE `orderDetails` ADD FOREIGN KEY (`quantityOrdered`) REFERENCES `products` (`productLine`);

ALTER TABLE `orders` ADD FOREIGN KEY (`orderNumber`) REFERENCES `orderDetails` (`orderLineNumber`);

ALTER TABLE `orders` ADD FOREIGN KEY (`status`) REFERENCES `customers` (`customerName`);

ALTER TABLE `payments` ADD FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`postalCode`);

ALTER TABLE `employees` ADD FOREIGN KEY (`employeesNumber`) REFERENCES `employees` (`reportsTo`);

ALTER TABLE `customers` ADD FOREIGN KEY (`contactLastName`) REFERENCES `employees` (`jobTitle`);

ALTER TABLE `employees` ADD FOREIGN KEY (`firstName`) REFERENCES `offices` (`addressLine2`);
