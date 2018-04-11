function U = pde(f, N, u_w, u_o, u_z, u_n)
   h = 1/(N+1);
   
   [X, Y] = meshgrid(h:h:1-h);
   F = f(X, Y)*h^2;
   F(1,:) = F(1,:) - u_w(h:h:1-h);
   F(N,:) = F(N,:) - u_o(h:h:1-h);
   F(:,1) = F(:,1) - u_z(h:h:1-h)';
   F(:,N) = F(:,N) - u_n(h:h:1-h)';
   dstF = dst(dst(F')');
   dstU = zeros(N,N);
   
   for k = 1:N
       for l = 1:N
           dstU(k,l) = dstF(k,l)/(2*(cos(pi*k*h)+cos(pi*l*h)-2));
       end
   end
   
   U = idst(idst(dstU')');
end