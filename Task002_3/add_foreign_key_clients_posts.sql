USE sql_dz_vvs;

alter table posts add index IX_posts_user_id (user_id),
add constraint PK_posts_user_id FOREIGN KEY (user_id) references clients(id) on update cascade on delete restrict;

/*
alter table posts drop constraint PK_posts_user_id;
alter table posts drop index IX_posts_user_id;

select * from information_schema.TABLE_CONSTRAINTS
where constraint_name = "PK_posts_user_id";
*/