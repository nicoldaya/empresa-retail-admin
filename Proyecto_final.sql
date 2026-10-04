USE `empresa-retail-db`;
-- Crear roles 
create role 'ana';
create role 'pedro';
create role 'marta';

-- crear usuarios
create user 'ana_crm'@'localhost' identified by 'Retail2026!Caja';
create user 'pedro_mkt'@'localhost' identified by 'Retail2026!Stock';
create user 'marta_auditoria'@'localhost' identified by 'Retail2026!Admin';

-- usuarios creados 
SELECT user, host FROM mysql.user;
-- verificar usuarios creados 
SELECT User, Host FROM mysql.user WHERE User IN ('ana_crm', 'pedro_mkt', 'marta_auditoria');

-- Asignar cada usuario a su rol
grant 'ana' to 'ana_crm'@'localhost';
grant 'pedro' to 'pedro_mkt'@'localhost';
grant 'marta' to 'marta_auditoria'@'localhost';

-- permisos otorgados
show tables;
-- Permisos para el rol 'ana'
GRANT SELECT, INSERT, UPDATE ON `empresa-retail-db`.`cliente` TO 'ana';
GRANT SELECT, INSERT, UPDATE ON `empresa-retail-db`.`interaccion` TO 'ana';

-- Permisos para el rol 'pedro'
GRANT SELECT, INSERT, UPDATE, delete ON `empresa-retail-db`.`canal` TO 'pedro';
GRANT SELECT, INSERT, UPDATE,delete ON `empresa-retail-db`.`campania` TO 'pedro';
GRANT SELECT ON `empresa-retail-db`.`cliente` TO 'pedro';

-- Permisos para el rol 'marta'
GRANT SELECT ON `empresa-retail-db`.`conversion` TO 'marta';
GRANT EXECUTE ON `empresa-retail-db`.* TO 'marta';

-- comprobar los permisos finales asignados a cada rol
show grants for 'ana';
show grants for 'pedro';
show grants for 'marta';

-- comprobar la asgnacion del rol y permisos a cada usuario
SHOW GRANTS FOR 'ana_crm'@'localhost';
SHOW GRANTS FOR 'pedro_mkt'@'localhost';
SHOW GRANTS FOR 'marta_auditoria'@'localhost';

-- Activar los roles por defecto al iniciar sesión
SET DEFAULT ROLE 'ana' TO 'ana_crm'@'localhost';
SET DEFAULT ROLE 'pedro' TO 'pedro_mkt'@'localhost';
SET DEFAULT ROLE 'marta' TO 'marta_auditoria'@'localhost';

FLUSH PRIVILEGES;