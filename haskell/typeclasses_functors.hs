-- 1.
-- MyMaybe
data MyMaybe a = MyNothing | MyJust a deriving Show
instance Functor MyMaybe where
  fmap _ MyNothing = MyNothing
  fmap f (MyJust a) = MyJust (f a)

-- MyEither
data MyEither a b = MyLeft a | MyRight b deriving Show
instance Functor (MyEither a) where
  fmap _ (MyLeft a) = MyLeft a
  fmap f (MyRight b) = MyRight (f b)

-- Prod
newtype Prod e a = Prod (e,a) deriving Show
instance Functor (Prod e) where
  fmap f (Prod (e,a)) = Prod (e, f a)

-- 2.
-- En papel demostrar.

-- 3. (No sabemos sobre monoides acá)
-- No! pure x = Prod (¿_?,x) Podriamos usar bot, pero luego no cumpliría alguna propiedad.

-- 5.a.
newtype All = All Bool
instance Monoid All where
  mempty = All True
  mappend = (conj)

conj :: All -> All -> All
conj (All x) (All y) = All $ x && y

-- 5.b.
newtype IntSum = IntSum Int
instance Monoid IntSum where
  mempty = IntSum 0
  mappend = (sum')

sum' :: IntSum -> IntSum -> IntSum
sum' (IntSum x) (IntSum y) = IntSum $ x + y

-- 5.c.
newtype IntProd = IntProd Int
instance Monoid IntProd where
  mempty = IntProd 0
  mappend = (prod')

prod' :: IntProd -> IntProd -> IntProd
prod' (IntProd x) (IntProd y) = IntProd $ x * y

-- 6.
instance Monoid e => Applicative (Prod e) where
  pure a = Prod (mempty, a)
  Prod (t,f) <*> p = fmap f p

-- 7.
newtype Env v a = Env (v -> a)
instance Functor (Env v) where
  fmap t (Env p) = Env  (t . p)

newtype Res r a = Res (a -> r)
-- No podemos dado que los tipos de las funciones no nos permiten llegar a una función de b -> r
