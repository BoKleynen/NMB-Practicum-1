function [U] = PDE(f, N, u_w, u_o, u_z, u_n)
   h = 1/(N+1);
   
   [F, ~] = meshgrid(0:h:1);
   F = f(F)*h^2;
   F(1,:) = F(1,:) - u_w(0:h:N+2);
   F(N+2,:) = F(N+2,:) - u_o(0:h:N+2);
   F(:,1) = F(:,1) - u_z(0:h:N+2)';
   F(:,N+2) = F(:,N+2) - u_n(0:h:N+2)';
   F
   dstF = dst(dst(F')');
   dstU = zeros(N,N);
   
   for k = 2:N+1
       for l = 2:N+1
           dstU(k,l) = dstF(k,l)/(2*cos(pi*k*h)+cos(pi*l*h)-2);
       end
   end
   
   U = idst(idst(dstU')');
end