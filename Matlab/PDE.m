function [U] = PDE(f, N, u_w, u_o, u_z, u_n)
   h = 1/(N+1);
   
   [F, ~] = meshgrid(0:h:1);
   F = f(F)*h^2;
   F(1,:) = F(1,:) - u_w(0:h:N);
   F(N,:) = F(N,:) - u_o(0:h:N);
   F(:,1) = F(:,1) - u_z(0:h:N)';
   F(:,N) = F(:,N) - u_n(0:h:N)';
   dstF = dst(dst(F')');
   dstU = zeros(N,N);
   
   for k = 1:N
       for l = 1:N
           dstU(k,l) = dstF(k,l)/(2*cos(pi*k*h)+cos(pi*l*h)-2);
       end
   end
   
   U = idst(idst(dstU')');
end